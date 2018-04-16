FROM node
RUN npm install express
RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app
COPY ./app ./
CMD ["node", "app.js"]