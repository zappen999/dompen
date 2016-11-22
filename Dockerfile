FROM node:7
MAINTAINER Johan Kanefur <johan.canefur@gmail.com>

WORKDIR /home/node/app

COPY scripts ./scripts
COPY src ./src
COPY package.json .

RUN npm install --production

# Run tests in production environment, will stop image build if tests fail
RUN ./scripts/test.sh

ENTRYPOINT [ "bash", "./scripts/entrypoint.sh" ]
