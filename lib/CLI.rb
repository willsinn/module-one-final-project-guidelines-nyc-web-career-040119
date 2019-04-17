### Scrape Website and load db

 #helper
def input(value)
  value = self.input
  value
end
def main_menu
  puts "Welcome to SwimDB\n"
  puts "1. Search for an existing Swimmer"
  puts "2. Update the name of an existing Swimmer"
  puts "3. Create new Event"
  puts "4. Delete existing Event"
  puts "\n\n"
  input = gets.chomp
  num = input.to_i
  case num
    when 1 then search_by_swimmer_name()
    when 2 then get_params_for_name_update()
    when 3 then create_event()
    when 4 then destroy_event()
  else
    puts "Invalid entry."
  end
end
###How would I see all the Events I participated in and how would I see my fastest time?
def search_by_swimmer_name
  puts "Search for swimmer by name:"
  puts "\n"
  input = gets.chomp
  swimmers = Swimmer.all
  swimmers.find do |swimmer|
    if swimmer.name == input
      puts "Result: "
      puts "\n Name: #{swimmer.name} | Age: #{swimmer.age} | Gender: #{swimmer.gender_string} "
      swimmer_time = swimmer.swim_event_times.first
      swimmer_event = swimmer_time.event
      puts " Event: #{swimmer_event.name} Time:#{swimmer_time.time_minutes}"
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


def create_event
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
