import { configDotenv } from "dotenv";

const { PrismaClient } = require("@prisma/client");
const fs = require("fs");
const path = require("path");
configDotenv()

const SEED_WITH_FAKE = process.env.SEED_WITH_FAKE == "TRUE" || false;

const prismaClient = new PrismaClient();

async function seed() {

    const seedFilesPath = path.join(__dirname + "\\seeders"); // add path for seed files

    const seedFiles = fs
        .readdirSync(seedFilesPath)
        .filter((file: string) => file.endsWith(".seed.ts"));

    for (const seedFile of seedFiles) {
        const seedFilePath = path.join(seedFilesPath, seedFile);
        const { default: seeder } = require(seedFilePath);
        console.log(`Seeder: ${seedFilePath.split('\\')[seedFilePath.split('\\').length - 1]}`)
        if (seeder.important) {
            await seeder.seedFunction(prismaClient);
        }

        if (SEED_WITH_FAKE && !seeder.important)
            await seeder.seedFunction();

        if (!SEED_WITH_FAKE && !seeder.important)
            console.log("-- SKIPPED --");
    }

    console.log("Seeding completed successfully");
}

seed()
    .catch((error) => {
        console.error("Seeding error:", error);
    })
    .finally(async () => {
        await prismaClient.$disconnect();
    });
