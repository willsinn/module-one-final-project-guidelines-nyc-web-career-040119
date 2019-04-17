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
    when 2
        puts "Change Swimmer Name\n_____________________"
        get_params_for_name_update()
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
      swimmer_time = swimmer.swim_event_times.first
      swimmer_event = swimmer_time.event
      puts "Result: "
      puts "|\tName\t  |\tAge\t|\tGender\t  | \tEvent\t   |\tTime\t|"
      puts "_______________________________________________________________________________________"
      puts "\t#{swimmer.name}\t \t#{swimmer.age}\t \t#{swimmer.gender_string}\t     #{swimmer_event.name}     #{swimmer_time.time_minutes}\t"
      else
        return
    end
  end
end
#search_by_swimmer_name
#loops, gotta create loop break


##Return Swimmer's Event and Record Swim
def get_params_for_name_update

  puts "enter current name:"
  input = gets.chomp
  swimmers = Swimmer.all
  swimmers.find do |swimmer|
      if swimmer.name == input
        input
      else
        puts "no swimmer by that name, try again."
        get_params_for_name_update()
      end
    end
  puts ""
  puts "enter new name:"
  new_input = gets.chomp
  if 'name' == 'new_name'
    puts "values are the same, try again."
    get_params_for_name_update()
  else
    change_swimmer_name(input, new_input)
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
