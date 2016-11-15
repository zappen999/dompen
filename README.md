# Dompen
Dompen is a Node.js boilerplace for microservices. It provides a development
environment using Docker.

## Why?
To be able to quickly spin up new Microservices without needing to configure
stuff such as linters, tests, and other best practices.

## Best practices
* use strict


## Tests
* `npm test` - Runs unit tests and generates coverage report in `/coverage`
* `npm run test:watch` - Runs unit tests watches for changes
* `npm run test:native` - Runs unit tests without Babel transpiling. This is used
to perform a final test inside the Docker container with Node.js 7 environment.

Tests should be placed next to the implementation. Example:
```
├── index.js
└── index.spec.js
```