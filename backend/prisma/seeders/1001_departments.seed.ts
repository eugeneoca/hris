import crypt from "../../src/helpers/cryptography";

async function seedFunction(prismaClient: any) {
    console.log("Generate Departments")

    const main = await prismaClient.department.create({
        data: {
            name: "main department",
            code: crypt.generateCode(10)
        }
    });

}

export default {
    important: true,
    seedFunction
};