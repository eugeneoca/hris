import { Request, Response } from "express";
import { Router } from "express";
import { body, validationResult } from "express-validator";
import crypt from "../helpers/cryptography"
import { PrismaClient } from "@prisma/client";
import AuthMiddleware from "../helpers/authentication";
import querystring from "querystring";
import axios from "axios";

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
        .isNumeric(),
    body("first_name")
        .if(body("role_id").equals("3")).exists().withMessage("is required.")
        .notEmpty().withMessage("should not be empty."),
    body("last_name")
        .if(body("role_id").equals("3")).exists().withMessage("is required.")
        .notEmpty().withMessage("should not be empty."),
    body("rank_id")
        .if(body("role_id").equals("3")).exists().withMessage("is required.")
        .notEmpty().withMessage("should not be empty.")
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

    const role_id = request.body.role_id;
    const rank_id = request.body.rank_id;
    const division_id = request.body.division_id;
    //const areas = request.body.areas;

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

    try {

        let first_name = "";
        let last_name = "";
        const code = crypt.generateCode(9); // Limit by ZKTeco
        // if (role_id == 3) {
        //     const biometric = await prismaClient.biometric.findFirstOrThrow({
        //         where: {
        //             is_active: true
        //         }
        //     });

        //     const credentials = querystring.stringify({
        //         username: biometric.username,
        //         password: biometric.password
        //     });
        //     const zk = await axios.post(`${process.env.ZK_TECO_API_URL}/api-token-auth/`, credentials);

        //     const device = await axios.get(`${process.env.ZK_TECO_API_URL}/iclock/api/terminals/1/`, {
        //         headers: {
        //             "Authorization": `Token ${zk.data.token}`
        //         }
        //     });

        //     const device_area_id = parseInt(device.data.area.id);
        //     first_name = request.body.first_name;
        //     last_name = request.body.last_name;

        //     const data = querystring.stringify({
        //         emp_code: code,
        //         department: division_id,
        //         first_name: first_name,
        //         last_name: last_name,
        //         area: [device_area_id]
        //     });


        //     await axios.post(`${process.env.ZK_TECO_API_URL}/personnel/api/employees/`, data,
        //         {
        //             headers: {
        //                 "Authorization": `Token ${zk.data.token}`
        //             }
        //         });
        // }
        const password = request.body.password;
        const encrypted_password = await crypt.encrypt(password);

        const user = await prismaClient.user.create({
            data: {
                username: username,
                password: <string>encrypted_password,
                role_id: role_id,
                division_id: division_id,
            },
            include: {
                role: true,
                division: true,
                //areas: true,
            }
        });

        if (role_id == 3) {

            // Include the 'user' field when creating the employee profile
            const profile = await prismaClient.employee.create({
                data: {
                    first_name: first_name,
                    last_name: last_name,
                    user: {
                        connect: {
                            id: user.id
                        }
                    }
                }
            });
        }

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
                "division": {
                    select: {
                        name: true,
                    }
                },
                employee_profile: {
                    select: {
                        first_name: true,
                        last_name: true
                    }
                }
                //"areas": true,
            }
        });

        return response
            .status(201)
            .json(created_user);

    } catch (error: any) {
        return response
            .status(400)
            .json({
                code: response.statusCode,
                message: error.message
            });
    }


})

route.get('/:id', (request: Request, response: Response) => {
    response.sendStatus(404);
});

export default route;