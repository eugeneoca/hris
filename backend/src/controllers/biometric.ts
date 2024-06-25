import http from "http";
import querystring from "querystring"
import { Request, Response } from "express";
import { Router } from "express";
import { PrismaClient } from "@prisma/client";
import { body, validationResult } from "express-validator";
import AuthMiddleware from "../helpers/authentication";
import axios from "axios";

const prismaClient = new PrismaClient();
const route = Router()


route.get('/', async (request: Request, response: Response) => {

    try {

        const biometric = await prismaClient.biometric.findFirstOrThrow({
            where: {
                is_active: true
            }
        });

        const data = querystring.stringify({
            username: biometric.username,
            password: biometric.password
        });

        const zk = await axios.post(`${process.env.ZK_TECO_API_URL}/api-token-auth/`, data);

        return response
            .status(200)
            .json(zk.data);

    } catch (error: any) {
        return response.status(404).json({
            code: response.statusCode,
            message: error.message
        });
    }


});

route.post('/', [
    body("username")
        .exists().withMessage("is required.")
        .notEmpty().withMessage("should not be empty."),
    body("password")
        .exists().withMessage("is required.")
        .notEmpty().withMessage("should not be empty.")
], AuthMiddleware.ensureAuthenticated, async (request: Request, response: Response) => {
    const errors = validationResult(request);

    if (!errors.isEmpty()) {
        return response
            .status(400)
            .json(errors.array());
    }

    const username = request.body.username;
    const password = request.body.password;
    try {

        const data = querystring.stringify({
            username: username,
            password: password
        });

        await axios.post(`${process.env.ZK_TECO_API_URL}/api-token-auth/`, data);

        await prismaClient.$transaction([
            prismaClient.biometric.updateMany({
                data: {
                    is_active: false
                }
            }),
            prismaClient.biometric.create({
                data: {
                    username: username,
                    password: password,
                    is_active: true
                }
            })
        ]);

        return response
            .status(201)
            .json({
                code: response.statusCode,
                message: "Created succesfully"
            });
    } catch (error: any) {
        return response
            .status(400)
            .json({
                code: response.statusCode,
                message: error.message
            });
    }


});


export default route;