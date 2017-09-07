"use strict";
exports.handler = (event, context, callback) => {
  console.log(JSON.stringify(event));
  const name = `${event.queryStringParameters.name}`;
  const body = {
    hello: name
  };
  const response = {
    statusCode: 200,
    body: JSON.stringify(body)
  };
  callback(null, response);
};
