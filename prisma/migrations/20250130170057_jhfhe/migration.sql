/*
  Warnings:

  - The `instructions` column on the `Exercice` table would be dropped and recreated. This will lead to data loss if there is data in the column.

*/
-- AlterTable
ALTER TABLE "Exercice" DROP COLUMN "instructions",
ADD COLUMN     "instructions" TEXT[];
