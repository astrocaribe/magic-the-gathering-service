'use strict';

exports.generate = (name, message, status, log) => {

  var err = new Error();

  err.name = name;
  err.message = message;
  err.status = status;

  log.error(err);

  return err;
};
