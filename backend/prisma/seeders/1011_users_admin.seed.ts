async function seedFunction(prismaClient: any) {
    console.log("Generate Admin Users");

    const administratorUser = await prismaClient.user.create({
        data: {
            username: "administrator",
            password: "$hack",
            role_id: 1,
            code: "test",
            department_id: 1,
        }
    })
}

export default {
    important: true,
    seedFunction
};