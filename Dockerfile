FROM node:16

WORKDIR /app

COPY package.json .
RUN npm install

COPY ./dist/index.js .

EXPOSE 9008

CMD [ "node", "index.js" ]