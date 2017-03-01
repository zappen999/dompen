# Dompen
> Microservice boilerplate for Node.js applications, to quickly spin up
> new services.

## Features
### Isolated environment
* [Docker](https://www.docker.com/) for contained app environment and easy deploy process.
* Separate `node_modules` between host and container.
* Unit tests runs in the production environment inside the container.
* README boilerplate to help with documentation ([found here](service.md)).
* Mounted SSH agent to be able to pull private dependencies

### Development environment
* Support for ES6 (container runs Node 7 with --harmony-async-await).
* Process restarts on change (using [nodemon](https://github.com/remy/nodemon)).
* ESlint configuration extended from Google.
* Debug with Chrome Developer Tools using port 9222.
* Unit testing using [mocha](https://github.com/mochajs/mocha).
* Generate code coverage reports using [istanbul nyc](https://github.com/istanbuljs/nyc).

## Setup & Usage
* Install development dependencies with `npm install` (linter configs, pre-commit hooks)
* Start the container with `docker-compose up`

Restart the container when installing new dependencies in package.json
(or run `npm install` after entering container with `npm run bash`)

### Setting up a service
The typical flow of setting up a service would be to:<br>
1. Create a repository for your service<br>
2. Add Dompen as a remote: `git remote add dompen git@github.com:zappen999/dompen.git`<br>
3. Rebase Dompen: `git rebase dompen master`<br>
4. Keep up with Dompen updates by merging master once in a while: `git merge dompen master`<br>
5. Replace this `README.md` with `service.md` and fill out the boilerplate documentation<br>

### Scripts
| **SCRIPT**            | **USAGE**                                           | **CAVEATS**
|----------------------:|-----------------------------------------------------|-------------
|**npm test**           |Runs all unit tests using mocha                      |The container must be running
|**npm run test:watch** |Runs all unit tests and watches for changes          |The container must be running
|**npm run cov**        |Runs all unit tests and generates coverage           |The container must be running
|**npm run open:cov**   |Opens the code coverage report in the default browser|The container must be running
|**npm run precommit**  |Runs eslint just like the git precommit hook does    |-
|**npm run bash**       |Enters the container with bash                       |The container must be running
|**npm run reinstall**  |Installs dependencies inside the container           |The container must be running

### Testing
Tests should be placed next to the implementation. Ex:
```
├── index.js
└── index.spec.js
```
