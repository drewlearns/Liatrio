FROM node:18-alpine
WORKDIR /app/
COPY package.json /app/
COPY . .
RUN npm install
EXPOSE 80
ENTRYPOINT ["npm", "start"]