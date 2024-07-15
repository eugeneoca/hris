/*
  Warnings:

  - You are about to drop the column `code` on the `users` table. All the data in the column will be lost.
  - You are about to drop the `profiles` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `ranks` table. If the table is not empty, all the data it contains will be lost.

*/
-- DropForeignKey
ALTER TABLE `profiles` DROP FOREIGN KEY `profiles_rank_id_fkey`;

-- DropForeignKey
ALTER TABLE `profiles` DROP FOREIGN KEY `profiles_user_id_fkey`;

-- DropIndex
DROP INDEX `users_code_key` ON `users`;

-- AlterTable
ALTER TABLE `users` DROP COLUMN `code`;

-- DropTable
DROP TABLE `profiles`;

-- DropTable
DROP TABLE `ranks`;

-- CreateTable
CREATE TABLE `employees` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `first_name` VARCHAR(191) NOT NULL,
    `last_name` VARCHAR(191) NOT NULL,
    `middle_name` VARCHAR(191) NULL,
    `mobile` VARCHAR(191) NULL,
    `email` VARCHAR(191) NULL,
    `profile_picture_url` VARCHAR(191) NULL,
    `address` LONGTEXT NULL,
    `gender` VARCHAR(191) NULL,
    `birthday` DATETIME(3) NULL,
    `sss_number` VARCHAR(191) NULL,
    `pagibig_number` VARCHAR(191) NULL,
    `philhealth` VARCHAR(191) NULL,
    `tin_number` VARCHAR(191) NULL,
    `position` VARCHAR(191) NULL,
    `rank` INTEGER NULL,
    `sick_leave_limit` INTEGER NULL,
    `vacation_leave_limit` INTEGER NULL,
    `hire_date` DATETIME(3) NULL,
    `termination_date` DATETIME(3) NULL,
    `user_id` INTEGER NOT NULL,
    `created_at` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
    `updated_at` DATETIME(3) NOT NULL,

    UNIQUE INDEX `employees_first_name_key`(`first_name`),
    UNIQUE INDEX `employees_email_key`(`email`),
    UNIQUE INDEX `employees_user_id_key`(`user_id`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- AddForeignKey
ALTER TABLE `employees` ADD CONSTRAINT `employees_user_id_fkey` FOREIGN KEY (`user_id`) REFERENCES `users`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;
