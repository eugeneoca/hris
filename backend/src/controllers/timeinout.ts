import { Request, Response } from "express";
import { PrismaClient } from "@prisma/client";
import { Router } from "express";
import AuthMiddleware from "../helpers/authentication";
import multer from "multer";

const prismaClient = new PrismaClient();
const route = Router()

const admin = require('firebase-admin');
const path = require('path');

const serviceAccountPath = path.resolve(__dirname, '../../hris-bdce1-firebase-adminsdk-d8fpz-eec27e4ba5.json');
// const serviceAccount = require('./hris-bdce1-firebase-adminsdk-d8fpz-eec27e4ba5.json');
const serviceAccount = require(serviceAccountPath);

admin.initializeApp({
  credential: admin.credential.cert(serviceAccount),
  storageBucket: 'gs://hris-bdce1.appspot.com'
});

const bucket = admin.storage().bucket();

const upload = multer({ storage: multer.memoryStorage() });

route.post('/create', [AuthMiddleware.ensureAdmin, upload.single('image')], async (request: Request, response: Response) => {
    const { userid, time, date, type, geolocation } = request.body;

    if (!request.file) {
        return response.status(400).json({ error: "No image file provided." });
    }

    const imageFile = request.file;

    try {
        // Upload image to Firebase Storage
        const blob = bucket.file(imageFile.originalname);
        const blobStream = blob.createWriteStream({
            metadata: {
                contentType: imageFile.mimetype
            }
        });

        blobStream.on('error', (err: Error) => {
            console.error(err);
            response.status(500).json({ error: "Failed to upload image to Firebase." });
        });

        blobStream.on('finish', async () => {
            const [signedUrl] = await blob.getSignedUrl({
                action: 'read',
                expires: '03-01-2500'
            });

            const newTimeInOut = await prismaClient.timeInOut.create({
                data: {
                    userid: parseInt(userid),
                    time: new Date(time),
                    date: new Date(date),
                    type: type,
                    geolocation: geolocation,
                    imageurl: signedUrl
                }
            });

            response.status(201).json(newTimeInOut);
        });

        blobStream.end(imageFile.buffer);
    } catch (error) {
        console.error(error);
        response.status(500).json({ error: "Failed to create TimeInOut entry." });
    }
});

route.get('/all', AuthMiddleware.ensureAdmin, async (request: Request, response: Response) => {
    const { time, date, userid, type } = request.query;

    try {
        let allTimeInOut;

        if (time || date || userid || type) {
            allTimeInOut = await prismaClient.timeInOut.findMany({
                where: {
                    AND: [
                        time ? { time: new Date(time as string) } : {},
                        date ? { date: new Date(date as string) } : {},
                        userid ? { userid: Number(userid as string) } : {},
                        type ? { type: type.toString() } : {}
                    ]
                },
                include: {
                    user: true
                }
            });
        } else {
            allTimeInOut = await prismaClient.timeInOut.findMany({
                include: {
                    user: true
                }
            });
        }

        response.status(200).json(allTimeInOut);
    } catch (error) {
        response.status(500).json({ error: "Failed to fetch TimeInOut entries." });
    }
});
export default route;