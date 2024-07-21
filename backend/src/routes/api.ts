
const express = require('express');
import RoleController from "../controllers/role";
import UserController from "../controllers/user";
import AuthenticationController from "../controllers/authentication"
import AuthMiddleware from "../helpers/authentication";
// import TransactionController from "../controllers/transaction";
import TimeInOutController from "../controllers/timeinout";
import DivisionsController from "../controllers/division";
import EmployeesController from "../controllers/employees";

const route = express.Router()

route.get('/', (req: any, res: any) => {
    res.sendStatus(200);
})

route.use('/users', UserController);
route.use('/roles', AuthMiddleware.ensureAuthenticated, RoleController);
route.use('/divisions', AuthMiddleware.ensureAuthenticated, DivisionsController);
route.use('/auth', AuthenticationController);
// route.use('/zkteco/transactions', TransactionController);
route.use('/timeinout', TimeInOutController);
route.use('/employees', EmployeesController);

export default route;