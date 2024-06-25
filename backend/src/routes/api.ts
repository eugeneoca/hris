
const express = require('express');
import RoleController from "../controllers/role";
import UserController from "../controllers/user";
import AuthenticationController from "../controllers/authentication"
import AuthMiddleware from "../helpers/authentication";
import DepartmentController from "../controllers/department";
//import AreaController from "../controllers/area";
import BiometricController from "../controllers/biometric";
import TransactionController from "../controllers/transaction";
import ProfileController from "../controllers/profile";
import RankController from "../controllers/rank";

const route = express.Router()

route.get('/', (req: any, res: any) => {
    res.sendStatus(200);
})

route.use('/users', UserController);
route.use('/profiles', ProfileController);
route.use('/ranks', RankController);
route.use('/roles', AuthMiddleware.ensureAuthenticated, RoleController);
route.use('/departments', DepartmentController);
//route.use('/areas', AreaController);
route.use('/auth', AuthenticationController);
route.use('/zkteco/auth', BiometricController);
route.use('/zkteco/transactions', TransactionController);

export default route;