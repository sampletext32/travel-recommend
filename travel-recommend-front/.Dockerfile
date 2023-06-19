#STAGE 1
FROM node:latest AS build
WORKDIR /src/app
COPY package*.json .
RUN npm i
COPY . .
RUN npm run build

#STAGE 2
FROM nginx:latest
COPY nginx.conf /etc/nginx/nginx.conf
COPY --from=build /src/app/dist/salary-predict-front /usr/share/nginx/html
