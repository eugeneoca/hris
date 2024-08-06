/*
  Warnings:

  - A unique constraint covering the columns `[divisionid,date]` on the table `production_values` will be added. If there are existing duplicate values, this will fail.

*/
-- CreateIndex
CREATE UNIQUE INDEX `production_values_divisionid_date_key` ON `production_values`(`divisionid`, `date`);
