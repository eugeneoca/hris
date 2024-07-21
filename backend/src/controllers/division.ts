import { Request, Response } from "express";
import { Router } from "express";
import { PrismaClient } from "@prisma/client";
import AuthMiddleware from "../helpers/authentication";

const prismaClient = new PrismaClient();
const route = Router()

route.get('/', AuthMiddleware.ensureAdmin, async (request: Request, response: Response) => {
    const divisions = await prismaClient.division.findMany();
    response
        .status(200)
        .json(divisions);
});

// Create a division
route.post('/create', AuthMiddleware.ensureAdmin, async (request: Request, response: Response) => {
    const { name } = request.body;
    const newDivision = await prismaClient.division.create({
        data: {
            name
        }
    });
    response.status(201).json(newDivision);
});

// Update a division
route.put('/:id', AuthMiddleware.ensureAdmin, async (request: Request, response: Response) => {
    const { id } = request.params;
    const { name } = request.body;
    const updatedDivision = await prismaClient.division.update({
        where: { id: parseInt(id) },
        data: {
            name
        }
    });
    response.status(200).json(updatedDivision);
});

// Delete a division
route.delete('/:id', AuthMiddleware.ensureAdmin, async (request: Request, response: Response) => {
    const { id } = request.params;
    await prismaClient.division.delete({
        where: { id: parseInt(id) }
    });
    response.status(204).send();
});

export default route;