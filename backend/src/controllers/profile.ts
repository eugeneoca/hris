import { Request, Response } from "express";
import { Router } from "express";
import { PrismaClient } from "@prisma/client";
import { body, validationResult } from "express-validator";
import AuthMiddleware from "../helpers/authentication";

const prismaClient = new PrismaClient();
const route = Router()

route.get('/', async (request: Request, response: Response) => {
    const profiles = await prismaClient.profile.findMany();

    response
        .status(200)
        .json(profiles);
});

route.get('/:id', async (request: Request, response: Response) => {

    try {
        if (!parseInt(request.params.id)) {
            throw Error("Invalid parameter :id.");
        }

        const profile = await prismaClient.profile.findFirstOrThrow({
            where: {
                id: parseInt(request.params.id)
            }
        });
        return response.status(200).json(
            profile
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

// route.post('/', [
//     body("first_name")
//         .exists().withMessage("is required.")
//         .notEmpty().withMessage("should not be empty."),
//     body("last_name")
//         .exists().withMessage("is required.")
//         .notEmpty().withMessage("should not be empty.")
// ], AuthMiddleware.ensureAuthenticated, async (request: Request, response: Response) => {
//     const errors = validationResult(request);

//     if (!errors.isEmpty()) {
//         return response
//             .status(400)
//             .json(errors.array());
//     }

//     return response
//         .status(200)
//         .json({
//             message: "Create/Update Profile"
//         });
// });

route.delete("/:id", AuthMiddleware.ensureAuthenticated, async (request: Request, response: Response) => {

    const id = parseInt(request.params.id);

    try {
        await prismaClient.profile.findFirstOrThrow({
            where: {
                id: id
            }
        });

        const profile = await prismaClient.profile.delete({
            where: {
                id: id
            }
        });

        return response
            .status(204)
            .json(profile);
    } catch (error: any) {
        return response
            .status(404)
            .json({
                code: response.statusCode,
                message: error.message
            });
    }

});

export default route;