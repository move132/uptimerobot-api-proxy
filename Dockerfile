FROM node:16

RUN npm install -g pnpm && pnpm -v

WORKDIR /app

COPY package.json .
RUN pnpm install && pnpm run build

COPY dist/index.js .

EXPOSE 9008

CMD [ "node", "index.js" ]