import prisma from "~/prisma";

export default defineEventHandler(async (event) => {
  const users = await prisma.user.findMany();
  return {
    users,
  };
});
