# STAGE 1
FROM node:18-alpine AS build
WORKDIR /app
COPY react-app/package*.json ./
RUN npm install
COPY react-app/ ./
RUN npm run build

#STAGE 2
FROM nginx:alpine
COPY --from=build /app/build /usr/share/nginx/html
EXPOSE 80
