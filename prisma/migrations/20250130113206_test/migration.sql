/*
  Warnings:

  - You are about to drop the `RoutineExercice` table. If the table is not empty, all the data it contains will be lost.
  - Added the required column `routineId` to the `Exercice` table without a default value. This is not possible if the table is not empty.

*/
-- DropForeignKey
ALTER TABLE "RoutineExercice" DROP CONSTRAINT "RoutineExercice_exerciceId_fkey";

-- DropForeignKey
ALTER TABLE "RoutineExercice" DROP CONSTRAINT "RoutineExercice_routineId_fkey";

-- AlterTable
ALTER TABLE "Exercice" ADD COLUMN     "routineId" INTEGER NOT NULL;

-- DropTable
DROP TABLE "RoutineExercice";

-- AddForeignKey
ALTER TABLE "Exercice" ADD CONSTRAINT "Exercice_routineId_fkey" FOREIGN KEY ("routineId") REFERENCES "Routine"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
