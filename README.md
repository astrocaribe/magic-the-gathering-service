# Magic The Gathering Card Collection API

## Scope
This micro service will help manage a Magic The Gathering card collection
database, allowing a user to add, delete, update, and read cards from a MySQL
database using CRUD.  

This project is going to be used to compare with other [project that serves the
same purpose](https://github.com/astrocaribe/magic_collection), but coded in
Java using the [Play framework](https://playframework.com/).  

I know, "There are already projects like this already!", I can hear you say! But
this is a way to practice with JavaScript development using Node.js and Express,
with a different methodology that makes sense to me!

## Methodology
The idea is to make the service as defined as possible, clear boundaries that
can be tested thoroughly. Hence, this service is broken up into 3 mayor parts:

  * **server** - This unit takes care of the running server and route handling.
    This is basically Express, and so there is no need to test the framework
    itself (yes, I do trust that it does what it says it does!).
  * **logic** - This unit handles the logic that needs to take place between
    making the request, fetching the data, and returning the response.
  * **database** - This unit takes care of one thing and one thing only;
    performing queries and returning data.

Separating the service into units allows for distinct, testable units, with the
exception of the database unit. Since a reliable database connection is outside
our control, this piece will remain untested until I figure out a way to
reasonably handle database connections.

## Current Routes
Below are the current routes that this service handles, with a brief
description:  

#### Note:
This is a work in progress, so there are no routes just yet. Stay tuned for
more!

## Install and Management
##### To install dependencies:
`npm install`

##### To run server:  
First, copy the example config file and fill in the appropriate values:  
`cp config/config.js.example config.js`  
Then run the server:  
  `node run server.js`

##### To kill server:  
  `Ctrl + C` (no, with your keyboard, silly!)

##### To run (minimal) test suite:  
  `npm test`

[Sample Postman call collection](https://www.getpostman.com/collections/0b134add95a8ecec29bd).
