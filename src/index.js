'use strict';
console.log('Microservice started');

process.on('SIGTERM', function() {
  console.log('Shutting down gracefully...');
  process.exit(0);
});

module.exports = {
  something: 'something'
};
