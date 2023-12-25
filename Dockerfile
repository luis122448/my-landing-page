FROM node:lts AS build

WORKDIR /home/app

COPY ./package*.json /home/app
COPY ./tailwind.config.js /home/app
COPY ./astro.config.mjs /home/app
RUN npm install

COPY ./src /home/app/src
COPY ./public /home/app/public
RUN npm run build

FROM nginx:alpine AS runtime
COPY ./nginx.conf /etc/nginx/nginx.conf
COPY --from=build /home/app/dist /usr/share/nginx/html
EXPOSE 8080