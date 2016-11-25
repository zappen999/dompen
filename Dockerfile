FROM node:7.2.0
MAINTAINER Johan Kanefur <johan.canefur@gmail.com>

WORKDIR /home/node/app

COPY scripts ./scripts
COPY src ./src
COPY package.json .

# Install yarn to install and remove dependencies faster
RUN npm install -g yarn

# Install dev-dependencies to be able to run tests
RUN yarn

# Run tests. This will stop the image build if tests fail
RUN ./scripts/test.sh

# Remove dev dependencies after successful test
# This is equivalent to 'npm prune --production'
RUN yarn install --production --ignore-scripts --prefer-offline

ENTRYPOINT [ "bash", "./scripts/entrypoint.sh" ]
