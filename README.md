# Property management system ng @ RoR sample app

This project was generated with Rails, heavily inspired by a couple of the most popular angular+rails tutorials.

## Going over everything real fast

The app covers some basic crud functionality via an Angular frontend communicating with a Ruby on Rails backend. 
You can see a demo here: https://pms-apmats.herokuapp.com/

Instead of using the web app, you can instead consume the API in json format by doing a GET request for https://pms-apmats.herokuapp.com/properties/1?format=json or generally any other valid property ID.
You can get all the data for all the properties at once by doing a GET for https://pms-apmats.herokuapp.com/properties?format=json which would probably be a bit unwieldy if the database grew large enough.

To run this yourself:

1. Get ruby and postgresql installed
2. Set up the required ENV variables in the database.yml configuration file
3. Do a bundle install to set up all the gems
4. Run the db migrate and seed rake tasts
5. Run rail s and go to localhost:3000


## Remaining work

Currently, the test code is broken, tests should be rewritten. A prettier display-only view for properties should be created at some point.
Errors during crud operations originating in the back end are propagated to the front end but the message displayed is generic, we should be showing the user some more information based on what went wrong.
