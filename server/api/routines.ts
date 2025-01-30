import prisma from "~/prisma";
import { defineEventHandler, readBody, setResponseHeader } from "h3";

export default defineEventHandler(async (event) => {
  setResponseHeader(event, 'Access-Control-Allow-Origin', '*');
  setResponseHeader(event, 'Access-Control-Allow-Methods', 'GET, POST, PUT, DELETE');
  setResponseHeader(event, 'Access-Control-Allow-Headers', 'Content-Type');


  if (event.req.method === 'OPTIONS') {
    return {}; // Une réponse vide pour les requêtes OPTIONS
  }
  
  if (event.req.method === 'GET') {
   
    const routines = await prisma.routine.findMany({
      include: {
        exercises: true,
      },
    });

    return { routines };

  } else if (event.req.method === 'POST') {
    console.log('Création de la routine');
    const body = await readBody(event);
    const { name, exercises } = body;

    if (!name || !exercises || exercises.length === 0) {
      return { error: 'Nom de la routine, timer et exercices sont nécessaires' };
    }

    try {
      const routine = await prisma.routine.create({
        data: {
          name,            
          exercises: { 
            create: exercises.map((exercice: { name: string; gifUrl: string; instructions: string[] }) => ({
              name: exercice.name,
              image: exercice.gifUrl,
              instructions: exercice.instructions,
            }))
          }
        },
        include: {
          exercises: true, 
        }
      });

      return { routine };

    } catch (error) {
      console.error('Erreur lors de la création de la routine:', error);
      return { error: 'Erreur lors de la création de la routine' };
    }
  }

  return { error: 'Méthode non autorisée' };
});
