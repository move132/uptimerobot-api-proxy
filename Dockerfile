FROM node:16

WORKDIR /app

COPY package.json .
RUN npm install && npm run build

COPY index.js .

EXPOSE 9008

CMD [ "node", "index.js" ]