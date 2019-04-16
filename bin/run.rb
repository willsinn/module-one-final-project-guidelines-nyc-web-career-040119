require_relative '../config/environment'

## One SWIMMER to many EVENTS
## One EVENTS to many SWIMMERS

## Many SWIMMERS to one swimmer_event
## Many EVENTS to one swimmer_event
database = SQLite3::Database.new('db/development.db')



puts "HELLO WORLD"
