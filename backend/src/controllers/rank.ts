import { Request, Response } from "express";
import { Router } from "express";
import { PrismaClient } from "@prisma/client";
import { body, validationResult } from "express-validator";
import AuthMiddleware from "../helpers/authentication";

const prismaClient = new PrismaClient();
const route = Router()

route.get('/', async (request: Request, response: Response) => {
    const ranks = await prismaClient.rank.findMany();
    console.log(ranks)
    return response
        .status(200)
        .json(ranks);
});

route.get('/:id', async (request: Request, response: Response) => {

    try {
        if (!parseInt(request.params.id)) {
            throw Error("Invalid parameter :id.");
        }

        const rank = await prismaClient.rank.findFirstOrThrow({
            where: {
                id: parseInt(request.params.id)
            }
        });
        return response.status(200).json(
            rank
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
                message: "Rank already exists."
            })
    }

    var next_order = 0;
    const highest_order = await prismaClient.rank.aggregate({
        _max: {
            order: true
        }
    });

    next_order += highest_order._max.order ? highest_order._max.order + 1 : 1;
    console.log(next_order)
    const rank = await prismaClient.rank.create({
        data: {
            name: name,
            order: 1
        }
    });
    response
        .status(201)
        .json(rank);
});

route.delete("/:id", AuthMiddleware.ensureAuthenticated, async (request: Request, response: Response) => {

    const id = parseInt(request.params.id);

    try {
        await prismaClient.rank.findFirstOrThrow({
            where: {
                id: id
            }
        });

        const rank = await prismaClient.rank.delete({
            where: {
                id: id
            }
        });

        response
            .status(204)
            .json(rank)
    } catch (error: any) {
        response
            .status(404)
            .json({
                code: response.statusCode,
                message: error.message
            })
    }

});

export default route;