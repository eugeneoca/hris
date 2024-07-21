import { Request, Response } from "express";
import { Router } from "express";
import { PrismaClient } from "@prisma/client";
import AuthMiddleware from "../helpers/authentication";

const prismaClient = new PrismaClient();
const route = Router()

route.get('/all', AuthMiddleware.ensureAdmin, async (request: Request, response: Response) => {
    const roles = await prismaClient.role.findMany();
    response
        .status(200)
        .json(roles);
});

route.get('/:id', AuthMiddleware.ensureAdmin, async (request: Request, response: Response) => {

    try {
        if (!parseInt(request.params.id)) {
            throw Error("Invalid parameter :id.");
        }

        const role = await prismaClient.role.findFirstOrThrow({
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
})

export default route;