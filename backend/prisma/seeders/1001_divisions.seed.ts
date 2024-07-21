async function seedFunction(prismaClient: any) {
    console.log("Generate Divisions");

    const division = await prismaClient.division.create({
        data: {
            name: "bodega"
        }
    })
}

export default {
    important: true,
    seedFunction
};