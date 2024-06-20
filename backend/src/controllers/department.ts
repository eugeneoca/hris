import { Request, Response } from "express";
import { Router } from "express";
import { PrismaClient } from "@prisma/client";
import { body, validationResult } from "express-validator";
import AuthMiddleware from "../helpers/authentication";

const prismaClient = new PrismaClient();
const route = Router()

route.get('/', async (request: Request, response: Response) => {
    const roles = await prismaClient.department.findMany();
    response
        .status(200)
        .json(roles);
});

route.get('/:id', async (request: Request, response: Response) => {

    try {
        if (!parseInt(request.params.id)) {
            throw Error("Invalid parameter :id.");
        }

        const role = await prismaClient.department.findFirstOrThrow({
            where: {
                id: parseInt(request.params.id)
            }
        });
        return response.status(200).json(
            role
        );
    } catch (error: any) {
        return response
            .status(404)
            .json({
                code: response.statusCode,
                message: error.message
            })
    }
});

route.post('/', [
    body("code")
        .exists().withMessage("is required.")
        .notEmpty().withMessage("should not be empty."),
    body("name")
        .exists().withMessage("is required.")
        .notEmpty().withMessage("should not be empty.")
], AuthMiddleware.ensureAuthenticated, async (request: Request, response: Response) => {
    const errors = validationResult(request);

    if (!errors.isEmpty()) {
        return response
            .status(400)
            .json(errors.array());
    }

    const name = request.body.name;
    const code = request.body.code;

    const exists = !!await prismaClient.department.findFirst({
        where: {
            name: name
        }
    });

    if (exists) {
        return response
            .status(409)
            .json({
                code: response.statusCode,
                message: "Department already exists."
            })
    }

    const department = await prismaClient.department.create({
        data: {
            name: name,
            code: code
        }
    });
    response
        .status(201)
        .json(department);
});

route.delete("/:id", AuthMiddleware.ensureAuthenticated, async (request: Request, response: Response) => {

    const id = parseInt(request.params.id);

    try {
        const exists = await prismaClient.department.findFirstOrThrow({
            where: {
                id: id
            }
        });

        const department = await prismaClient.department.delete({
            where: {
                id: id
            }
        });

        response
            .status(204)
            .json(department)
    } catch {
        response
            .status(404)
            .json({
                code: 404,
                message: "Department does not exist."
            })
    }

});

export default route;