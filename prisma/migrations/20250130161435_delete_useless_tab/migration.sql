/*
  Warnings:

  - You are about to drop the column `timer` on the `Routine` table. All the data in the column will be lost.
  - You are about to drop the `User` table. If the table is not empty, all the data it contains will be lost.

*/
-- AlterTable
ALTER TABLE "Routine" DROP COLUMN "timer";

-- DropTable
DROP TABLE "User";
