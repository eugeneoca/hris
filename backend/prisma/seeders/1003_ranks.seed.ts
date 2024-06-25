import crypt from "../../src/helpers/cryptography";

async function seedFunction(prismaClient: any) {
    console.log("Generate Areas")

    const main = await prismaClient.rank.create({
        data: {
            name: "main rank",
            order: 1
        }
    });
}

export default {
    important: true,
    seedFunction
};