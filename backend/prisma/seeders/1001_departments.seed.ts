
async function seedFunction(prismaClient: any) {
    console.log("Generate Departments")

    const main = await prismaClient.department.create({
        data: {
            name: "main department",
            code: "1"
        }
    });

}

export default {
    important: true,
    seedFunction
};