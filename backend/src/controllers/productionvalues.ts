import { Request, Response } from "express";
import { Router } from "express";
import { PrismaClient } from "@prisma/client";
import AuthMiddleware from "../helpers/authentication";

const prismaClient = new PrismaClient();
const route = Router();

// Create Production Value
route.post('/create', AuthMiddleware.ensureAdmin, async (request: Request, response: Response) => {
    const productionValues = request.body;
    type ProductionValue = { date: string; divisionid: number; value: number };

    try {
        const newProductionValues = await Promise.all(productionValues.map(async (item: ProductionValue) => {
            const { date, divisionid, value } = item;
            // Validate date format
            const parsedDate = new Date(date);
            if (isNaN(parsedDate.getTime())) {
                throw new Error('Invalid date format');
            }

            return await prismaClient.productionValues.upsert({
                where: {
                    divisionid_date: {
                        divisionid: divisionid,
                        date: parsedDate
                    }
                },
                update: {
                    value: value
                },
                create: {
                    date: parsedDate,
                    divisionid: divisionid,
                    value: value
                }
            });
        }));
        
        response.status(201).json(newProductionValues);
    } catch (error) {
        console.error('Error creating or updating production values:', error);
        response.status(500).json({ error: 'Internal Server Error' });
    }
});

// Read All Production Values
route.get('/all', AuthMiddleware.ensureAdmin, async (request: Request, response: Response) => {
    const { from, to, divisionid } = request.query;

    try {
        const productionValues = await prismaClient.productionValues.findMany({
            where: {
                ...(divisionid && { divisionid: parseInt(divisionid as string) }), // Filter by divisionid if present
                ...(from && to && { // Filter by date range if both 'from' and 'to' are present
                    date: {
                        gte: new Date(from as string),
                        lte: new Date(to as string)
                    }
                })
            },
            select: { // Only return specific fields
                id: true,
                date: true,
                divisionid: true,
                value: true
            }
        });
        response.status(200).json(productionValues);
    } catch (error) {
        console.error('Error retrieving production values:', error);
        response.status(500).json({ error: 'Internal Server Error' });
    }
});

// Update Production Value
route.put('/:id', AuthMiddleware.ensureAdmin, async (request: Request, response: Response) => {
    const { id } = request.params;
    const { date, divisionid, value } = request.body;

    try {
        const updatedProductionValue = await prismaClient.productionValues.update({
            where: { id: parseInt(id) },
            data: {
                date: new Date(date),
                divisionid: divisionid,
                value: value
            }
        });
        response.status(200).json(updatedProductionValue);
    } catch (error) {
        console.error('Error updating production value:', error);
        response.status(500).json({ error: 'Internal Server Error' });
    }
});

// Delete Production Value
route.delete('/:id', AuthMiddleware.ensureAdmin, async (request: Request, response: Response) => {
    const { id } = request.params;

    try {
        await prismaClient.productionValues.delete({
            where: { id: parseInt(id) }
        });
        response.status(204).send();
    } catch (error) {
        console.error('Error deleting production value:', error);
        response.status(500).json({ error: 'Internal Server Error' });
    }
});

export default route;