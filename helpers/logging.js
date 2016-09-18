'use strict';

// Log messages unless NODE_ENV set to 'test'
exports.logExceptOnTest = (logMessage) => {

  if(process.env.NODE_ENV !== 'test') {
    console.log(logMessage);

    return('ok');
  }
};
