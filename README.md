# Dompen
> This service provides boilerplate to be able to quickly spin up
microservices.

*Maintainer: Johan Kanefur &lt;johan.canefur@gmail.com&gt;*

## TOC
<!-- TOC depthFrom:2 depthTo:6 withLinks:1 updateOnSave:1 orderedList:0 -->

- [Dependencies](#dependencies)
- [API](#api)
	- [Update user](#update-user)
- [Development](#development)
	- [Prerequisites](#prerequisites)
	- [Setup](#setup)
	- [Tools & Scripts](#tools-scripts)
- [Environment](#environment)
- [Contributing](#contributing)

<!-- /TOC -->

## Dependencies
This service does not depend on any other services in our cluster. If it had
any dependencies, they would appear like this:

| **SERVICE** | **USAGE**                            |
|------------:|--------------------------------------|
|**Logger**   |To log all process behaviour          |
|**Auth**     |To make sure consumers are authorized |


## API
This section should describe how other services can interact with this service.
As an example, this could be a JSON REST API.

### Update user
**POST /api/users/:id**

Updates information about an existing user, based on ID

**QUERY PARAMETERS**
* **id** - ID of the user to update

**REQUEST BODY**
```json
{ "username": "<string min:5 max:50 required>" }
```

**RESPONSE**

HTTP 200 - *The user was updated*
```json
{ "message": "Success" }
```

HTTP 400 - *The username was invalid*
```json
{ "message": "Invalid username" }
```

## Development
In this section, there should be clear instructions on how to setup the
development environment. It should contain all information to get the
project up and running to start contributing. First of all, we should list
all the dependencies needed.

### Prerequisites
To be able to get this project up and running, you'll need:
* Docker
* Docker Compose
* npm

### Setup
Follow these steps to get going:
* `git clone git@github.com:zappen999/dompen.git`
* `docker-compose up`

The service will now run in a Docker container named `dompen`
(specified in `docker-compose.yml`). The codebase is mounted into the container
and the server will be restarted on save.

### Tools & Scripts
In this section, we should describe the scripts in package.json, or any other
scripts for that matter.

| **SCRIPT**            | **USAGE**                                          | **CAVEATS**
|----------------------:|----------------------------------------------------|-------------
|**npm test**           |Runs all unit tests using mocha                     |The container must be running
|**npm run test:watch** |Runs all unit tests and watches for changes         |The container must be running
|**npm run coverage**   |Runs all unit tests and generates coverage          |The container must be running
|**npm run precommit**  |Runs eslint just like the git precommit hook does   |-

## Environment
Every service has it´s own runtime configuration. These should be specified in
´docker-compose.yml´ for the development environment, and described in this
section like so:

| **VARIABLE** | **DESCRIPTION**                                                      |
|-------------:|----------------------------------------------------------------------|
|**NODE_ENV**  |Sets the application to either **production** or **development** mode |

## Contributing
If some particular things should be done in specific ways, it should be
specified in this section, so that newcomers know what´s up.

Dompen has the following standards & workflows:
* Master branch should always be ready to deploy to production
* Pull requests with failing tests will be closed.
* This document should be filled out and up to date.
