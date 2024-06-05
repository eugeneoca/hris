import { PrismaClient } from "@prisma/client";
import { NextFunction } from "express";

const prismaClient = new PrismaClient();

async function ensureAuthenticated(request: any, response: any, next: NextFunction) {
    if (!!request.headers.authorization) {
        const is_valid = !!await prismaClient.session.findFirst({
            where: {
                token: request.headers.authorization.split(' ')[1],
                is_active: true
            }
        });
        if (is_valid)
            return next()
    }
    return response
        .status(401)
        .json({
            code: response.statusCode,
            message: "Unauthorized access."
        });
}

async function ensureAdmin(request: any, response: any, next: NextFunction) {
    if (!!request.headers.authorization) {
        const session = await prismaClient.session.findFirst({
            where: {
                token: request.headers.authorization.split(' ')[1],
                is_active: true
            },
            select: {
                user: true
            }
        });

        const role = await prismaClient.role.findFirst({
            where: {
                name: {
                    startsWith: "admin"
                }
            }
        })
        if (session?.user.role_id == role?.id)
            return next()
    }
    return response
        .status(401)
        .json({
            code: response.statusCode,
            message: "Unauthorized access."
        });
}

export default {
    ensureAuthenticated,
    ensureAdmin
};