### Scrape
def search_by_swimmer_name

puts "Welcome to swim comparisons"
puts "Enter your name to begin!"
search_name = gets.chomp

swimmers = Swimmer.all
swimmers.find do |swimmer|
  swimmer.gender == true ? 'Male' : 'Female'  
  if swimmer.name == search_name
    puts "Result: "
    puts "Name: #{swimmer.name} | Age: #{swimmer.age} | Gender: #{swimmer.gender} "
    return
  else
    puts "Not Results"
  end
end
end
# #How would I see all the Events I participated in and how would I see my fastest time?
# #Return Swimmer's Event and Record Swim
#        -As a SWIMMER entering my NAME, returns my AGE and GENDER =>
#        -As a SWIMMER entering my NAME, returns ALL EVENTS that I have SWAM =>
#        -As a SWIMMER entering my NAME and EVENT, returns an array of ALL my EVENT INSTANCES sorted ascending.=>
#        -As a SWIMMER entering my NAME and EVENT, returns my lowest TIME and DATE for that EVENT. => arr.first

#         Stretch: As a SWIMMER entering my NAME, return ALL EVENTS participated AND their respective FASTEST TIMES.

# ### One EVENT to many SWIMMERS
# name: of_event
# age: of_event
# gender: of_event
# #How to see all swimmers that have swam that unique Event and their rank.
# #Return ALL SWIMMER INSTANCES for that EVENT-AGE-GENDER.
#   -As a User entering an EVENT with AGE and GENDER, returns ALL INSTANCES of SWIMMERS respectively. =>
#   -As a User entering an EVENT with AGE and GENDER, returns a unique array that displays only the fastest of each SWIMMER. Sorts array ascending and displays data charted with EVENT-AGE-GENDER SWIMMER-EVENT TIME and DATE swum.
