// import http from "http";
// import querystring from "querystring"
// import { Request, Response } from "express";
// import { Router } from "express";
// import { PrismaClient } from "@prisma/client";
// import { body, validationResult } from "express-validator";
// import AuthMiddleware from "../helpers/authentication";
// import axios from "axios";
// import crypto from "crypto";

// const prismaClient = new PrismaClient();
// const route = Router()


// route.get('/', async (request: Request, response: Response) => {
//     try {

//         const biometric = await prismaClient.biometric.findFirstOrThrow({
//             where: {
//                 is_active: true
//             }
//         });

//         const data = querystring.stringify({
//             username: biometric.username,
//             password: biometric.password
//         });
//         const zk = await axios.post(`${process.env.ZK_TECO_API_URL}/api-token-auth/`, data);

//         const zk_transactions = await axios.get(`${process.env.ZK_TECO_API_URL}/iclock/api/transactions/`, {
//             headers: {
//                 "Authorization": `Token ${zk.data.token}`
//             }
//         });
//         return response
//             .status(200)
//             .json(zk_transactions.data);
//     } catch (error) {
//         console.log(error)
//         return response.status(404).json({
//             code: response.statusCode,
//             message: "Device may be offline or credentials is invalid."
//         });
//     }
// });


// export default route;