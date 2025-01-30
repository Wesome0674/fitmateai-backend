/*
  Warnings:

  - You are about to drop the column `routineId` on the `Exercice` table. All the data in the column will be lost.

*/
-- DropForeignKey
ALTER TABLE "Exercice" DROP CONSTRAINT "Exercice_routineId_fkey";

-- AlterTable
ALTER TABLE "Exercice" DROP COLUMN "routineId";

-- CreateTable
CREATE TABLE "RoutineExercice" (
    "id" SERIAL NOT NULL,
    "routineId" INTEGER NOT NULL,
    "exerciceId" INTEGER NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "RoutineExercice_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "RoutineExercice_routineId_exerciceId_key" ON "RoutineExercice"("routineId", "exerciceId");

-- AddForeignKey
ALTER TABLE "RoutineExercice" ADD CONSTRAINT "RoutineExercice_routineId_fkey" FOREIGN KEY ("routineId") REFERENCES "Routine"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "RoutineExercice" ADD CONSTRAINT "RoutineExercice_exerciceId_fkey" FOREIGN KEY ("exerciceId") REFERENCES "Exercice"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
