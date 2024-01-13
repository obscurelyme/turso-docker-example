FROM node:20-alpine3.19
WORKDIR /app
COPY ./package.json ./package-lock.json ./
RUN npm ci
COPY . .
EXPOSE 3000
CMD ["node", "index.js"]