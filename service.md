# Service name
> This service acts like a logging API for other services

*Maintainer: Jane Doe &lt;jane.doe@mail.com&gt;*

## TOC
<!-- TOC depthFrom:2 depthTo:6 withLinks:1 updateOnSave:1 orderedList:0 -->

- [Dependencies](#dependencies)
- [API](#api)
	- [Post logs](#post-logs)
- [Development](#development)
	- [Prerequisites](#prerequisites)
	- [Setup](#setup)
	- [Tools & Scripts](#tools-scripts)
- [Environment](#environment)
- [Contributing](#contributing)

<!-- /TOC -->

## Dependencies
This service does not depend on any other services in our cluster.

## API
This service provides a JSON REST API.

### Create log entries
**POST /logs**
Creates a JSON log entry

**REQUEST BODY**

** NOTE:** `time` must be a string that can be parsed by `Date()`
```json
{
  "time": "<integer required>",
  "severity": "<int min:0 max:6 required>",
  "message": "<string min:1 required>",
  "meta": "<any>"
}
```

**RESPONSE**

HTTP 201 - *Log successfully created*
```json
{ "message": "Success" }
```

HTTP 400 - *Severity input invalid*
```json
{ "message": "Severity invalid" }
```

HTTP 400 - *Message input invalid*
```json
{ "message": "Invalid message value" }
```

HTTP 400 - *Time value invalid*
```json
{ "message": "Time format not recognised" }
```

## Development
### Prerequisites
To be able to get this project up and running, you'll need:
* Docker
* Docker Compose
* npm

### Setup
Follow these steps to get going:
* `git clone git@github.com:repo/repo.git`
* `docker-compose up`

The service will now build and run in a Docker container. The codebase is
mounted into the container and the server will be restarted on save.

### Tools & Scripts

| **SCRIPT**            | **USAGE**                                          | **CAVEATS**
|----------------------:|----------------------------------------------------|-------------
|**npm test**           |Runs all unit tests using mocha                     |The container must be running
|**npm run test:watch** |Runs all unit tests and watches for changes         |The container must be running
|**npm run coverage**   |Runs all unit tests and generates coverage          |The container must be running
|**npm run precommit**  |Runs eslint just like the git precommit hook does   |-
|**npm run bash**       |Enters the container with bash                      |-

## Environment

| **VARIABLE** | **DESCRIPTION**                                                      |
|-------------:|----------------------------------------------------------------------|
|**NODE_ENV**  |Sets the application to either **production** or **development** mode |
|**LOG_FILE**  |Decides where our log file will be stored                             |

## Contributing
This service has the following standards & workflows:
* Master branch should always be ready to deploy to production
* Pull requests with failing tests will be closed.
* This document should be filled out and up to date.

### Testing
Tests should be easy to read. You can use this standard when writing tests.

```
describe <subject>
	it (the subject) should <act like this> when <this action is performed>
```

Real example:

```js
describe('Request handler', function() {
	it('should return false when receiving invalid payload', function() {
		// ...
	});
});
```
