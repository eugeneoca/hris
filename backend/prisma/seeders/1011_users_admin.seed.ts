async function seedFunction(prismaClient: any) {
    console.log("Generate Admin Users");

    const administratorUser = await prismaClient.user.create({
        data: {
            username: "administrator",
            password: "$hack",
            role: {
                connect: 
                    { name: "administrator" }
                
            },
            division: {
                connect: 
                    { name: "bodega" }
                
            },
            employee_profile: {
                create: {
                    first_name: "Admin",
                    last_name: "Admin"
                }
            }
        }
    })
}

export default {
    important: true,
    seedFunction
};