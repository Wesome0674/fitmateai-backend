import prisma from "~/prisma";
import { defineEventHandler, readBody, setResponseHeader } from "h3";

export default defineEventHandler(async (event) => {
  setResponseHeader(event, "Access-Control-Allow-Origin", "*");
  setResponseHeader(
    event,
    "Access-Control-Allow-Methods",
    "GET, POST, PUT, DELETE"
  );
  setResponseHeader(event, "Access-Control-Allow-Headers", "Content-Type");

  if (event.req.method === "OPTIONS") {
    return {}; // Une réponse vide pour les requêtes OPTIONS
  }

  if (event.req.method === "GET") {
    const stats = await prisma.saveStats.findMany();

    return { stats };
  } else if (event.req.method === "POST") {
    const body = await readBody(event);
    const { rate, sets, volume, reps } = body;

    if ( !rate || !sets || !volume || !reps) {
      return { error: "une erreur est survenue" };
    }

    try {
      const stats = await prisma.routine.create({
        data: {
          rate,
          sets,
          volume,
          reps,
        },
      });

      return { stats };
    } catch (error) {
      console.error("Erreur lors de la sauvegarde de l'entrainement:", error);
      return { error: "Erreur lors de la sauvegarde de l'entrainement" };
    }
  }

  return { error: "Méthode non autorisée" };
});
