-- CreateTable
CREATE TABLE `production_values` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `date` DATETIME(3) NOT NULL,
    `divisionid` INTEGER NOT NULL,
    `value` DOUBLE NOT NULL,
    `created_at` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
    `updated_at` DATETIME(3) NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- AddForeignKey
ALTER TABLE `production_values` ADD CONSTRAINT `production_values_divisionid_fkey` FOREIGN KEY (`divisionid`) REFERENCES `division`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;
