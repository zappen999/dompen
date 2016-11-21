#!/bin/bash
export TERM=xterm
./node_modules/.bin/mocha --harmony-async-await --watch './src/**/*.spec.js'
