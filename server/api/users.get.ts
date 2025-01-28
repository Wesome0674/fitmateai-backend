import prisma from "~/prisma";
import { defineEventHandler } from "h3";

export default defineEventHandler(async (event) => {

  setResponseHeader(event, 'Access-Control-Allow-Origin', '*');
  setResponseHeader(event, 'Access-Control-Allow-Methods', 'GET, POST, PUT, DELETE');
  setResponseHeader(event, 'Access-Control-Allow-Headers', 'Content-Type');
  
  const users = await prisma.user.findMany();
  return {
    users,
  };
});
