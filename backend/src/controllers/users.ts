import { Request, Response } from "express";
import { Router } from "express";
import { body, validationResult } from "express-validator";
import crypt from "../helpers/cryptography"
import { PrismaClient } from "@prisma/client";
import AuthMiddleware from "../helpers/authentication";

const route = Router()
const prismaClient = new PrismaClient()

route.get('/', [AuthMiddleware.ensureAuthenticated, AuthMiddleware.ensureAdmin], async (request: Request, response: Response) => {

    const users = await prismaClient.user.findMany({
        select: {
            "id": true,
            "username": true,
            "role": {
                select: {
                    name: true
                }
            },
        }
    })

    response
        .status(200)
        .json(users);
});

route.post('/', [
    body("username")
        .exists().withMessage("is required.")
        .notEmpty().withMessage("should not be empty."),
    body("password")
        .exists().withMessage("is required.")
        .notEmpty().withMessage("should not be empty.")
        .isLength({ min: 5 }).withMessage("should be at least 5 characters."),
    body("role_id")
        .exists().withMessage("is required.")
        .notEmpty().withMessage("should not be empty.")
        .isNumeric()
], async (request: Request, response: Response) => {
    const errors = validationResult(request);

    if (!errors.isEmpty()) {
        return response
            .status(400)
            .json(errors.array());
    }

    const username = request.body.username;

    const exists = !!await prismaClient.user.findFirst({
        where: {
            username: username
        }
    });

    if (exists) {
        return response
            .status(409)
            .json({
                code: response.statusCode,
                message: "Account already exists."
            })
    }

    const code = request.body.code;
    const role_id = request.body.role_id;
    const department_id = request.body.department_id;
    const areas = request.body.areas;

    const role_exists = !!await prismaClient.role.findFirst({
        where: {
            id: role_id
        }
    });

    if (!role_exists) {
        return response
            .status(404)
            .json({
                code: response.statusCode,
                message: "Role does not exist."
            })
    }

    const password = request.body.password;
    const encrypted_password = await crypt.encrypt(password);

    const user = await prismaClient.user.create({
        data: {
            username: username,
            password: <string>encrypted_password,
            code: code,
            role_id: role_id,
            department_id: department_id,
            areas: {
                connect: areas.map(function (id: Number) { return { id }; })
            }
        },
        include: {
            role: true,
            department: true,
            areas: true
        }
    });

    const created_user = await prismaClient.user.findFirst({
        where: {
            id: user.id
        },
        select: {
            "id": true,
            "username": true,
            "role": {
                select: {
                    name: true
                }
            },
            "department": {
                select: {
                    name: true
                }
            },
            "areas": true
        }
    });

    response
        .status(201)
        .json(created_user);

})

route.get('/:id', (request: Request, response: Response) => {
    response.sendStatus(404);
})

export default route;