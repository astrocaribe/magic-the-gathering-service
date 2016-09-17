# Magic The Gathering Card Collection API

## Scope
This micro service will help manage a Magic The Gathering card collection
database, allowing a user to add, delete, update, and read cards from a MySQL
database using CRUD.  

This project is going to be used to compare with other [project that serves the
same purpose](https://github.com/astrocaribe/magic_collection), but coded in
Java using the [Play framework](https://playframework.com/).

## Current Routes
Below are the current routes that this service handles, with a brief
description:  

#### Note:
This is a work in progress, so there are no routes just yet. Stay tuned for
more!

## Install and Management
To install dependencies:  
  `npm install`

To run server:  
First, copy the example config file and fill in the appropriate values:  
  `cp config/config.js.example config.js`  
Then run the server:  
  `node run server.js`

To kill server:  
  `Ctrl + C` (no, with your keyboard, silly!)

To run (minimal) test suite:
  `npm test`

[Sample Postman call collection](https://www.getpostman.com/collections/0b134add95a8ecec29bd).
