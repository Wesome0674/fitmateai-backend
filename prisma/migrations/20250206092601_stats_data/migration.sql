-- CreateTable
CREATE TABLE "SaveStats" (
    "id" SERIAL NOT NULL,
    "rate" INTEGER NOT NULL,
    "sets" INTEGER NOT NULL,
    "volume" INTEGER NOT NULL,
    "resps" INTEGER NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "SaveStats_pkey" PRIMARY KEY ("id")
);
