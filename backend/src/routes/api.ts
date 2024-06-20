
const express = require('express');
import RoleController from "../controllers/roles";
import UserController from "../controllers/users";
import AuthenticationController from "../controllers/authentication"
import AuthMiddleware from "../helpers/authentication";
import DepartmentController from "../controllers/department";
import AreaController from "../controllers/area";

const route = express.Router()

route.get('/', (req: any, res: any) => {
    res.sendStatus(200);
})

route.use('/users', UserController);
route.use('/roles', AuthMiddleware.ensureAuthenticated, RoleController);
route.use('/departments', DepartmentController);
route.use('/areas', AreaController);
route.use('/auth', AuthenticationController);

export default route;