# Magic The Gathering Card Collection API

## Project Status
[![Build Status](https://travis-ci.org/astrocaribe/magic-the-gathering-service.svg?branch=develop)](https://travis-ci.org/astrocaribe/magic-the-gathering-service)  
This project build status is tracked with Travis CI.

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

Separating the service into units allows for distinct, testable pieces, with the
exception of the database unit. Since a reliable database connection is outside
our control, this piece will remain untested until I figure out a way to
reasonably handle database connections.

## Installation and Management
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

##### Sample service calls:
[Sample Postman call collection](https://www.getpostman.com/collections/0b134add95a8ecec29bd).

<br />
<br />

##### Sample Database
Included in this project is a sample MySQL database with the current tables in
use. Copy the dump from the `resources/db` folder, and import into your MySQL
tool of choice (I currently use Sequel Pro).

<br/>
<br/>

## Current Routes
The current routes that this service handles, with a brief description:  

  * GET /ping  
    - Pings the service to verify that it is alive.
  * GET /cards  
    - Retrieves paged result for cards in the collection.

More details about these routes below:  

### GET "Resource Alive" Ping Resource
Pings the service to verify the service is alive. Returns the name, version, and
description of the service.

##### HTTP Verb + Route:
```
  GET /ping
```

##### Required Inputs
  * None

##### Optional Inputs
  * None

##### Example request
```shell
  $> curl http://localhost:4000/ping
```

##### Example Response
```json
{
  "name": "magic-the-gathering-service",
  "version": "1.0.0",
  "description": "This is a micro service to provision a Magic The Gathering card collection."
}
```

##### Resource Data
The data for the response is supplied by the project's `package.json`.

### GET Cards Resource
Retrieves paged card collection from the database. Returns at most 10 records at
a time, given an optional query parameter.

##### HTTP Verb + Route
```
  GET /cards
```

##### Required Inputs
  * None

##### Optional Inputs
  * **page** query parameter  
    This parameter is used to retrieve a specific page of results. Each page
    consists of 10 results (or the remainder of records, if the last page is
    requested).  
    If a page is requested that doesn't have any data, then an empty data set is
    returned.
    If the page query parameter is not supplied, the first page of results is
    returned.

##### Example Request
```shell
  curl -X GET http://localhost:4000/cards?page=1
```

##### Example Response
```json
{
  "data": [
    {
      "id": 1,
      "name": "Press For Answers",
      "mana_cost": "{1}{U}",
      "converted_mana_cost": 2,
      "type": "Sorcery",
      "sub_type": null,
      "text": "Tap target creature. It doesn't untap during its controller's next untap step.\n\nInvestigate. (Put a colorless Clue artifact token onto the battlefield with \"2, Sacrifice this artifact: Draw a card.\")",
      "flavor_text": "",
      "expansion": "Shadows Over Innistrad",
      "power": null,
      "toughness": null,
      "rarity": "Common",
      "quantity": 1,
      "card_number": "80",
      "colors": [
        "Blue"
      ]
    },
    {
      "id": 2,
      "name": "Inquisitor's Ox",
      "mana_cost": "{3}{W}",
      "converted_mana_cost": 4,
      "type": "Creature",
      "sub_type": "Ox",
      "text": "Delurium - Inquisitor's Ox gets +1/+0 and has vigilance as long as there are four or more card types among cards in your graveyard.",
      "flavor_text": "Many fields now lie fallow in Gavony, as the oxen have been confiscated to perform other duties.",
      "expansion": "Shadows Over Innistrad",
      "power": 2,
      "toughness": 5,
      "rarity": "Common",
      "quantity": 1,
      "card_number": "24",
      "colors": [
        "White"
      ]
    },
    ...
  ],
  "page": "0",
  "totalCount": 34
}
```

##### Resource Data
The main `magic_collection` MySQL database supplies all the data for the response.

MySQL tables:
  * cards
  * card_colors

<br />
<br />

## To Do:
There will be several improvements that I plan to make as I navigate JavaScript
and Node.js; I'll outline there here as I go along, so that you may keep up as
well.

  * Work caching into the service, to limit the calls to the database.

Have any suggestions? Shoot me a line and I'll try to work those in! If you're
interested in what you see, please feel free to fork or put in a pull request!

<br/>
<br/>

## Disclaimers
The textual information presented through this API about Magic: The Gathering is
copyrighted by Wizards of the Coast.  
This API is not produced, endorsed, supported, or affiliated with Wizards of the
Coast.
