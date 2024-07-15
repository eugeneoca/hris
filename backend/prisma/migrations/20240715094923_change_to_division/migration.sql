/*
  Warnings:

  - You are about to drop the column `department_id` on the `users` table. All the data in the column will be lost.
  - You are about to drop the `biometrics` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `department` table. If the table is not empty, all the data it contains will be lost.
  - Added the required column `division_id` to the `users` table without a default value. This is not possible if the table is not empty.

*/
-- DropForeignKey
ALTER TABLE `users` DROP FOREIGN KEY `users_department_id_fkey`;

-- AlterTable
ALTER TABLE `users` DROP COLUMN `department_id`,
    ADD COLUMN `division_id` INTEGER NOT NULL;

-- DropTable
DROP TABLE `biometrics`;

-- DropTable
DROP TABLE `department`;

-- CreateTable
CREATE TABLE `division` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `name` VARCHAR(191) NOT NULL,
    `created_at` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
    `updated_at` DATETIME(3) NOT NULL,

    UNIQUE INDEX `division_name_key`(`name`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- AddForeignKey
ALTER TABLE `users` ADD CONSTRAINT `users_division_id_fkey` FOREIGN KEY (`division_id`) REFERENCES `division`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;
