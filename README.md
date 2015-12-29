== README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...


Please feel free to use a different markup language if you do not plan to run
<tt>rake doc:app</tt>.



# Property management system ng @ RoR sample app

This project was generated with Rails, heavily inspired by a couple of the most popular angular+rails tutorials.

## Going over everything real fast

The app covers some basic crud functionality via an Angular frontend communicating with a Ruby on Rails backend. 
You can see a demo here: https://pms-apmats.herokuapp.com/

Instead of using the web app, you can instead consume the API in json format by doing a GET request for https://pms-apmats.herokuapp.com//properties/1?format=json or generally any other valid property ID.

To run this yourself:

1. Get ruby and postgresql installed
2. Set up the required ENV variables in the database.yml configuration file
3. Run the db migrate and seed rake tasts
4. Run rail s and go to localhost:3000


## Remaining work

Currently, the test code is broken, tests should be rewritten. A prettier display-only view for properties should be created at some point.
Errors during crud operations originating in the back end are propagated to the front end but the message displayed is generic, we should be showing the user some more information based on what went wrong.
