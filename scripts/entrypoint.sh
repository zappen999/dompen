#!/bin/bash
set -e

echo "Forwarded SSH keys:"
ssh-add -l

# SIGTERM handler
handler() {
  if [ $pid -ne 0 ]; then # 0 is the docker entrypoint
    # tell the node process to gracefully shut down
    kill -SIGTERM "$pid"

    # wait for it to die
    wait "$pid"
  fi
  exit 143 # 128 + 15 = SIGTERM
}

# silence npm
npm config set loglevel warn

# setup callback handler
trap 'kill ${!}; handler' SIGTERM

npm install
./scripts/test.sh

if [ "$NODE_ENV" = "production" ]; then
  echo "Running in production mode..."
  node --harmony-async-await src/index.js &
elif [ "$NODE_ENV" = "development" ]; then
  echo "Running in development mode. Installing dev-dependencies..."
  ./node_modules/.bin/nodemon --inspect=9222 --harmony-async-await src/index.js &
fi

pid="$!" # get the PID from the last output (started process)
echo "Process $pid spawned"

# wait forever
while true
do
  tail -f /dev/null & wait ${!}
done
