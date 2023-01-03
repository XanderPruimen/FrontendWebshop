# WORKS!
FROM node:lts-alpine

RUN npm install -g http-server

WORKDIR /vetsend/app

COPY package*.json ./

RUN npm install

COPY . .

RUN npm run build

EXPOSE 8080
EXPOSE 9000
CMD ["http-server", "dist"]
