FROM node:16-alpine AS builder
WORKDIR /app/usr
COPY ./package.json ./
RUN npm install
COPY ./ ./
RUN npm run build

FROM nginx:latest
COPY --from=builder app/usr/build /usr/share/nginx/html
#nginx starts automatically