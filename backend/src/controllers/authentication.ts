import { Request, Response } from "express";
import { Router } from "express";
import { body, header, validationResult } from "express-validator";
import crypt from "../helpers/cryptography"
import { PrismaClient } from "@prisma/client";
import jwt from "jsonwebtoken";
import { configDotenv } from "dotenv";
import AuthMiddleware from "../helpers/authentication";

configDotenv()

const ACCESS_TOKEN_SECRET = process.env.ACCESS_TOKEN_SECRET || "secret"

const route = Router();
const prismaClient = new PrismaClient();

route.post('/login', [
    body("username")
        .exists().withMessage("is required.")
        .notEmpty().withMessage("should not be empty."),
    body("password")
        .exists().withMessage("is required.")
        .notEmpty().withMessage("should not be empty.")
], async (request: Request, response: Response) => {
    const errors = validationResult(request);

    if (!errors.isEmpty()) {
        return response
            .status(400)
            .json(errors.array());
    }

    const username = request.body.username;
    const password = request.body.password;

    const user = await prismaClient.user.findFirst({
        where: {
            username: username
        }
    });

    if (!user) {
        return response
            .status(404)
            .json({
                code: response.statusCode,
                message: "User not found."
            });
    }

    const is_valid = await crypt.compare(password, user.password);
    if (!is_valid) {
        return response
            .status(401)
            .json({
                code: response.statusCode,
                message: "Unauthorized access."
            });
    }

    const accessToken = jwt.sign(user, ACCESS_TOKEN_SECRET);

    await prismaClient.session.updateMany({
        where: {
            user_id: user.id
        },
        data: {
            is_active: false
        }
    });

    const session = await prismaClient.session.create({
        data: {
            user_id: user.id,
            token: accessToken,
        },
        select: {
            user: {
                select: {
                    id: true,
                    username: true,
                    role: {
                        select: {
                            id: true,
                            name: true
                        }
                    }
                }
            },
            token: true
        }
    });

    return response
        .status(200)
        .json(session);

})

route.get('/logout', AuthMiddleware.ensureAuthenticated, [
], async (request: Request, response: Response) => {
    await prismaClient.session.updateMany({
        where: {
            token: request.headers.authorization?.split(" ")[1],
            is_active: true
        },
        data: {
            is_active: false
        }
    });

    return response
        .status(200)
        .json({
            code: response.statusCode,
            message: "User logged out."
        });

})



export default route;