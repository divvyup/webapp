FROM node:9.4.0-alpine
RUN apk update && apk add git
RUN mkdir -p /usr/build/app
WORKDIR /usr/build/app
RUN git clone https://github.com/divvyup/webapp && cd webapp && git pull
WORKDIR /usr/build/app/webapp
RUN npm install
RUN npm run build

FROM node:9.4.0-slim
RUN mkdir -p /usr/src/app/dist
WORKDIR /usr/src/app
COPY --from=0 /usr/build/app/webapp/dist ./dist
COPY --from=0 /usr/build/app/webapp/server .
RUN npm install
CMD [ "npm", "start" ]