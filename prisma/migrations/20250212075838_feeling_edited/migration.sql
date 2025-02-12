/*
  Warnings:

  - Added the required column `feeling` to the `SaveStats` table without a default value. This is not possible if the table is not empty.

*/
-- CreateEnum
CREATE TYPE "Feeling" AS ENUM ('GOOD', 'BAD', 'AVERAGE');

-- AlterTable
ALTER TABLE "SaveStats" DROP COLUMN "feeling",
ADD COLUMN     "feeling" "Feeling" NOT NULL;
