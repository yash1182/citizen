FROM node:16.17-alpine

ENV HOST_NETWORK=true

RUN mkdir -p /home/node/app/node_modules && chown -R node:node /home/node/app

WORKDIR /home/node/app

COPY package.json ./
COPY .npmrc ~/.npmrc

# RUN sed -i "s|https://localhost|https://host.docker.internal|g" package.json

USER node

RUN npm config set strict-ssl false
RUN npm set //localhost/nexus/repository/npm-group/:_authToken=NpmToken.3e792573-0045-34f2-80d6-7c13f82dbd7c

COPY --chown=node:node . .

RUN npm install


CMD [ "npm", "start" ]
