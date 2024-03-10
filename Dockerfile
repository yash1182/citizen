FROM node:16.17-alpine

RUN mkdir -p /home/node/app/node_modules && chown -R node:node /home/node/app

WORKDIR /home/node/app

COPY package.json ./

USER node

RUN npm set registry http://host.docker.internal:8081/repository/npm-group/
RUN npm set _auth=admin:YWRtaW46MTIz

COPY --chown=node:node . .

RUN npm install


CMD [ "npm", "start" ]
