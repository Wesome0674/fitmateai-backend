/*
  Warnings:

  - You are about to drop the column `resps` on the `SaveStats` table. All the data in the column will be lost.
  - Added the required column `reps` to the `SaveStats` table without a default value. This is not possible if the table is not empty.

*/
-- AlterTable
ALTER TABLE "SaveStats" DROP COLUMN "resps",
ADD COLUMN     "reps" INTEGER NOT NULL;
