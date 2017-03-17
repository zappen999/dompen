FROM node:7.5.0
MAINTAINER Johan Kanefur <johan.canefur@gmail.com>

WORKDIR /home/node/app

COPY config/ssh/ /root/.ssh
RUN chmod -R 400 /root/.ssh
COPY scripts ./scripts
COPY src ./src
COPY package.json .
COPY .nycrc .

ENTRYPOINT [ "bash", "./scripts/entrypoint.sh" ]
