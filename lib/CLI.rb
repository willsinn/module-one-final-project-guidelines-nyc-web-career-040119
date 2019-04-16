### Scrape Website and load db



###How would I see all the Events I participated in and how would I see my fastest time?
def search_by_swimmer_name
#-As a SWIMMER entering my NAME, returns my AGE and GENDER =>
puts "Welcome to swim comparisons"
puts "Enter your name to begin!"
input_name = gets.chomp

swimmers = Swimmer.all
swimmers.find do |swimmer|
  # Sad attempt to convert gender
  # case swimmer.gender
  # when true
  #   gender = 'Male'
  # else false
  #   gender = 'Female'
  # end
  if swimmer.name == input_name
    puts "Result: "
    puts "Name: #{swimmer.name} | Age: #{swimmer.age} | Gender: #{swimmer.gender_string} "
    puts "\n Is this you?"


    input_yes = gets.chomp
    if input_yes == 'y'
    swimmer_time = swimmer.swim_event_times.first
    swimmer_event = swimmer_time.event

    puts "Event: #{swimmer_event.name} Time: #{swimmer_time.time} seconds"

    end
    else
  end
  swimmer #run next method
end
puts "Sorry! No Swimmers by that name, check your spelling and try again."
#search_by_swimmer_name
#loops, gotta create loop break
end



##Return Swimmer's Event and Record Swim
def change_swimmer_name(name)
  binding.pry
end


#  -As a SWIMMER entering my NAME, returns ALL EVENTS that I have SWAM =>
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
