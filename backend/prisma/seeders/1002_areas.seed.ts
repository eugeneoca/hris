import crypt from "../../src/helpers/cryptography";

async function seedFunction(prismaClient: any) {
    console.log("Generate Areas")

    // const main = await prismaClient.area.create({
    //     data: {
    //         name: "main area",
    //         code: crypt.generateCode(10)
    //     }
    // });
}

export default {
    important: true,
    seedFunction
};