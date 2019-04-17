### Scrape Website and load db

 #helper
def main_menu

end

def input(value)
  value = self.input
  value
end


###How would I see all the Events I participated in and how would I see my fastest time?
def search_by_swimmer_name(swimmer)
  puts "Welcome to swim comparisons"
  puts "Enter your name to begin!"
  input = gets.chomp
  swimmers = Swimmer.all
  swimmers.find do |swimmer|
    if swimmer.name == input
      puts "Result: "
      puts "\n Name: #{swimmer.name} | Age: #{swimmer.age} | Gender: #{swimmer.gender_string} "
      swimmer_time = swimmer.swim_event_times.first
      swimmer_event = swimmer_time.event
      puts " Event: #{swimmer_event.name} Time: #{swimmer_time.time} seconds"
      else
        return
    end
  end
end
#search_by_swimmer_name
#loops, gotta create loop break


##Return Swimmer's Event and Record Swim
def get_params_for_name_update
puts "Change display name?\n\n"
puts "Input current name: "
input = gets.chomp

puts "Input your new name:\n\n"
new_input = gets.chomp
new_name = new_input

  if name == new_name
    puts "New value is the same, try again."
    get_params_for_name_update()
  else
    change_swimmer_name(name, new_name)
  end
end


def change_swimmer_name(name, new_name)
  swimmer = Swimmer.find_by(name: name)
  swimmer.update(name: new_name)
end


def create_event()

  name = gets.chomp
  age = gets.chomp
  gender = gets.chomp
  Event.find_or_create_by(name: name, age: age, gender: gender)
end

def destroy_event
  input = gets.chomp
  name = input
  target = Event.find_by(name: name)
  target.destroy
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
