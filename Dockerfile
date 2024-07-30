FROM node:lts AS build

WORKDIR /home/app

COPY ./package*.json /home/app
COPY ./tailwind.config.cjs /home/app
COPY ./astro.config.mjs /home/app
RUN npm install

COPY ./src /home/app/src
COPY ./public /home/app/public
RUN npm run build

FROM nginx:alpine AS runtime

# Copy the custom nginx configuration file to the container in the default location
COPY ./nginx.conf /etc/nginx/nginx.conf
# Copy the build output to replace the default nginx contents.
COPY --from=build /home/app/dist /usr/share/nginx/html

EXPOSE 4000