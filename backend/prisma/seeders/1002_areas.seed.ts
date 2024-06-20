
async function seedFunction(prismaClient: any) {
    console.log("Generate Areas")

    const main = await prismaClient.area.create({
        data: {
            name: "main area",
            code: "1"
        }
    });
}

export default {
    important: true,
    seedFunction
};