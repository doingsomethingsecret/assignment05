# ---------- STAGE 1: Build ----------
# Yahan hum React app ko "build" karte hain (source code -> static files)
FROM node:18-alpine AS build
WORKDIR /app
COPY react-app/package*.json ./
RUN npm install
COPY react-app/ ./
RUN npm run build

# ---------- STAGE 2: Serve ----------
# Yahan sirf build ka output lete hain, Node.js is stage me hota hi nahi
FROM nginx:alpine
COPY --from=build /app/build /usr/share/nginx/html
EXPOSE 80
