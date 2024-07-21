import { Request, Response } from "express";
import { PrismaClient } from "@prisma/client";
import { Router } from "express";
import { body, validationResult } from "express-validator";
import AuthMiddleware from "../helpers/authentication";
import crypt from "../helpers/cryptography"

const prismaClient = new PrismaClient();
const route = Router();

// Create Employee
route.post('/create', AuthMiddleware.ensureAdmin, [
    body("username")
        .exists().withMessage("is required.")
        .notEmpty().withMessage("should not be empty."),
    body("password")
        .exists().withMessage("is required.")
        .notEmpty().withMessage("should not be empty."),
    body("roleId")
        .isInt().withMessage("must be an integer."),
    body("divisionId")
        .isInt().withMessage("must be an integer."),
    body("firstName")
        .exists().withMessage("is required.")
        .notEmpty().withMessage("should not be empty."),
    body("lastName")
        .exists().withMessage("is required.")
        .notEmpty().withMessage("should not be empty."),
], async (request: Request, response: Response) => {
    const errors = validationResult(request);

    if (!errors.isEmpty()) {
        return response
            .status(400)
            .json(errors.array());
    }

    const { username, password, roleId, divisionId, firstName, lastName, middleName, mobile, email, address, gender, birthday, sssNumber, pagibigNumber, philhealth, tinNumber, position, rank, sickLeaveLimit, vacationLeaveLimit, hireDate, terminationDate, profilePictureUrl } = request.body;

    const existingUser = await prismaClient.user.findFirst({
        where: {
            username: username
        }
    });

    if (existingUser) {
        return response
            .status(409)
            .json({
                code: response.statusCode,
                message: "User already exists."
            });
    }

    const hashedPassword = await crypt.encrypt(password);

    const newUser = await prismaClient.user.create({
        data: {
            username: username,
            password: hashedPassword as string,
            role: {
                connect: { id: roleId }
            },
            division: {
                connect: { id: divisionId }
            }
        }
    });

    const newEmployee = await prismaClient.employee.create({
        data: {
            first_name: firstName,
            last_name: lastName,
            middle_name: middleName,
            mobile: mobile,
            email: email,
            profile_picture_url: profilePictureUrl,
            address: address,
            gender: gender,
            birthday: new Date(birthday),
            sss_number: sssNumber,
            pagibig_number: pagibigNumber,
            philhealth: philhealth,
            tin_number: tinNumber,
            position: position,
            rank: rank,
            sick_leave_limit: sickLeaveLimit,
            vacation_leave_limit: vacationLeaveLimit,
            hire_date: hireDate,
            termination_date: terminationDate,
            user: {
                connect: { id: newUser.id }
            }
        }
    });
    
    return response
        .status(201)
        .json(newEmployee);
});

// Read All Employees
route.get('/all', AuthMiddleware.ensureAdmin, async (request: Request, response: Response) => {
    try {
        const employees = await prismaClient.employee.findMany({
            include: { user: {
                include: {
                    role: true,
                    division: true
                }
            } }
        });

        return response.json(employees);
    } catch (error) {
        console.error('Error retrieving all employees:', error);
        return response.status(500).json({ error: 'Internal Server Error' });
    }
});

// Read Employee
route.get('/:id', AuthMiddleware.ensureAuthenticated, async (request: Request, response: Response) => {
    try {
        const employeeId = parseInt(request.params.id);

        const employee = await prismaClient.employee.findUnique({
            where: { id: employeeId },
            include: { user: true }
        });

        if (!employee) {
            return response
                .status(404)
                .json({ message: "Employee not found" });
        }

        return response.json(employee);
    } catch (error) {
        console.error('Error retrieving employee:', error);
        return response.status(500).json({ error: 'Internal Server Error' });
    }
});


// Update Employee
route.put('/:id', AuthMiddleware.ensureAdmin, [
    body("firstName").optional().notEmpty().withMessage("should not be empty."),
    body("lastName").optional().notEmpty().withMessage("should not be empty."),
    body("roleId").optional().isInt().withMessage("must be an integer."),
    body("divisionId").optional().isInt().withMessage("must be an integer."),
], async (request: Request, response: Response) => {
    const employeeId = parseInt(request.params.id);
    const errors = validationResult(request);

    if (!errors.isEmpty()) {
        return response
            .status(400)
            .json(errors.array());
    }

    const { firstName, lastName, middleName, mobile, email, address, gender, birthday, sssNumber, pagibigNumber, philhealth, tinNumber, position, rank, sickLeaveLimit, vacationLeaveLimit, hireDate, terminationDate, roleId, divisionId, profilePictureUrl } = request.body;

    const updatedEmployee = await prismaClient.employee.update({
        where: { id: employeeId },
        data: {
            first_name: firstName,
            last_name: lastName,
            middle_name: middleName,
            mobile: mobile,
            email: email,
            profile_picture_url: profilePictureUrl,
            address: address,
            gender: gender,
            birthday: birthday,
            sss_number: sssNumber,
            pagibig_number: pagibigNumber,
            philhealth: philhealth,
            tin_number: tinNumber,
            position: position,
            rank: rank,
            sick_leave_limit: sickLeaveLimit,
            vacation_leave_limit: vacationLeaveLimit,
            hire_date: hireDate,
            termination_date: terminationDate,
            user: {
                update: {
                    role: roleId ? { connect: { id: roleId } } : undefined,
                    division: divisionId ? { connect: { id: divisionId } } : undefined,
                }
            }
        }
    });

    return response.json(updatedEmployee);
});

// Delete Employee
route.delete('/:id', AuthMiddleware.ensureAdmin, async (request: Request, response: Response) => {
    const employeeId = parseInt(request.params.id);

    const employee = await prismaClient.employee.findUnique({
        where: { id: employeeId }
    });

    if (!employee) {
        return response
            .status(404)
            .json({ message: "Employee not found" });
    }

    await prismaClient.employee.delete({
        where: { id: employeeId }
    });

    return response
        .status(204)
        .send();
});

export default route;
