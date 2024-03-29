# WORKS!
FROM node:lts-alpine

RUN npm install -g http-server

WORKDIR /app

COPY package*.json ./

RUN npm install

COPY . .

RUN npm run build

EXPOSE 80
EXPOSE 9000
CMD ["http-server", "dist"]
