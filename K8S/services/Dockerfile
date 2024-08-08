FROM node:18
WORKDIR /app
COPY package*.json ./
RUN npm install
COPY . .
EXPOSE 2717
ENTRYPOINT [ "node", "index.js" ]
