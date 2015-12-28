# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


Property.create!(name: 'Beautiful Villa', 
description: 'A beautiful villa by the sea',
address: 'Beach Ave. 75',
property_type: 'Vacation',
floor: 0)
Property.create!(name: 'Great Apartment', 
description: 'A beautiful apartment in the city',
address: 'City Str. 75',
property_type: 'City',
floor: 5)
Property.create!(name: 'Affordable Apartment', 
description: 'An affordable apartment in the city',
address: 'City Str. 80',
property_type: 'City',
floor: 4)