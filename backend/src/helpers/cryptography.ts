
import bcrypt from "bcrypt";

const encrypt = (password: string) => {
    return new Promise((resolve: any, reject: any) => {
        bcrypt.genSalt(10, (error, salt) => {
            if (error)
                resolve(error)

            bcrypt.hash(password, salt, (error, hash) => {
                resolve(error == null ? hash : error);
            })
        })
    });
}

const compare = (plain: string, encrypted: string) => {
    return new Promise((resolve: any, reject: any) => {
        bcrypt.compare(plain, encrypted, (error, is_matched) => {
            resolve(error == null ? is_matched : error);
        })
    })

}

export default {
    encrypt,
    compare
}