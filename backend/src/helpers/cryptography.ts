
import bcrypt from "bcrypt";
import crypto from "crypto";

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

const generateCode = (length: number) => {
    return crypto.randomBytes(20).toString('hex').toUpperCase().slice(0, length);
}

export default {
    encrypt,
    compare,
    generateCode
}