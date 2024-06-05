
async function seedFunction(prismaClient: any) {
    console.log("Generate Roles")

    const administrator = await prismaClient.role.create({
        data: {
            name: "administrator"
        }
    })

    const staff = await prismaClient.role.create({
        data: {
            name: "staff"
        }
    })

    const employee = await prismaClient.role.create({
        data: {
            name: "employee"
        }
    })
}

export default {
    important: true,
    seedFunction
};