FROM node:16

RUN npm install -g pnpm && npm install -g tsup

WORKDIR /app

COPY ./src/index.ts package.json tsup.config.ts tsconfig.json .
RUN pnpm install && pnpm run build

EXPOSE 9008

CMD [ "node", "./dist/index.js" ]