### Scrape Website and load db

 #helper
def input(value)
  # until input(value).to_a.include?("quit")
  value = self.input
  value
end

def search_again_helper
  puts "Search again? (y/n):"
  input = gets.chomp
  case input
  when "y"
    puts "____________________\nNew swimmer search:"
    search_by_swimmer_name()
  when "n"
    puts "...Ending Search."
    main_menu()
  else
    puts "Invalid entry."
  end
end

def main_menu
  puts "\n\nSWIM DB MAIN-MENU\n"
  puts "1. Search for an existing Swimmer"
  puts "2. Create new Swimmer"
  puts "3. Update the name of an existing Swimmer"
  puts "4. Create new Event"
  puts "5. Delete existing Event"
  puts "\n"

  input = gets.chomp.to_i
  case input
    when 1
        puts "____________________\nSearch swimmer name:"
        search_by_swimmer_name()
    when 2
        puts "____________________\nCreate new swimmer:"
        create_swimmer()
    when 3
        puts "____________________\nChange swimmer name:"
        get_params_for_name_update()
    when 4
        puts "____________________\nCreate new swim event:"
        create_event()
    when 5
        puts "____________________\nDelete an EMPTY swim event:"
        event_list()
        destroy_event_swimmer_check()
     else
       puts "Invalid entry."
     end
   end
###How would I see all the Events I participated in and how would I see my fastest time?
def search_by_swimmer_name
  input = gets.chomp
  swimmers = Swimmer.all
  swimmers.find do |swimmer|
    if swimmer.name == input
      swimmer_time = swimmer.swim_event_times.first
      swimmer_event = swimmer_time.event
      puts "Result: "
      puts "|\tName\t  |\tAge\t|\tGender\t  | \tEvent\t   |\tTime\t|"
      puts "_______________________________________________________________________________________"
      puts "\t#{swimmer.name}\t \t#{swimmer.age}\t \t#{swimmer.gender_s}\t     #{swimmer_event.name}     #{swimmer_time.time_minutes}\t"
    end
    search_again_helper()
  end
  puts "No swimmer by that name."
  search_again_helper()
end




##Return Swimmer's Event and Record Swim
def get_params_for_name_update
  puts "current name:"
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
  puts "\nenter new name:"
  new_input = gets.chomp
  if 'name' == 'new_name'
    puts "values are the same, try again."
    get_params_for_name_update()
  else
    update_swimmer_name(input, new_input)
  end
end

def update_swimmer_name(name, new_name)
  swimmer = Swimmer.find_by(name: name)
  swimmer.update(name: new_name)
end

def create_event
  puts "new event name: "
  name = gets.chomp
  puts "event age group: "
  age = gets.chomp
  puts "event gender group: "
  gender = gets.chomp
  Event.find_or_create_by(name: name, age: age, gender: gender)
  puts "Congratulations! You've created Event: #{name} | #{age} | #{gender}\n "
end

def event_list
  events = Event.all
  puts "\tCURRENT ACTIVE EVENTS TABLE"
  events.each do |event|
    event
    puts "__________________________________________________________\n"
    puts "   id:#{event.id}   | name:#{event.name} | age:#{event.age} | gender:#{event.gender_e} |"
  end
end


###############################################################
#DESTROY

def destroy_event_swimmer_check
  puts "\n\nEnter Event ID to destroy:"
  bound_e_ids = SwimEventTime.all.map {|event_id| event_id.event_id }.uniq #array of event_ids w/ registered swimmers
  destroy_id = gets.chomp.to_i
  check = bound_e_ids.include?(destroy_id) ? "y" : "n"
    if check == "y"
      puts "Can't destroy with Swimmers registered."
      main_menu()
    end
    destroy_event(destroy_id)
end


def destroy_event(destroy_id)
  target = Event.find_by(id: destroy_id)
  confirm_destroy
  target.destroy
  puts "Event: #{id} has been deleted."
end

def confirm_destroy
  print "CONFIRM DESTROY?\nACTION MAY BE PERMANENT"
  STDIN.getch
end

##############################################
#CREATE SWIMMER
def create_swimmer
  puts "new swimmer name: "
  name = gets.chomp
  puts "swimmer age group: "
  age = gets.chomp
  puts "swimmer gender group: "
  gender = gets.chomp
  Swimmer.find_or_create_by(name: name, age: age, gender: gender)
  puts "Congratulations! You've created a new Swimmer: #{name} | #{age} | #{gender}\n "
end

def register_swimmer_to_event
  puts "swimmer name:"
  swimmer = gets.chomp
  puts "event id:"
  event_id = gets.chomp
  puts "starting time:"
  time = gets.chomp
  SwimEventTime.find_or_create_by(swimmer: swimmer, event_id: event_id, time: time)
  puts "Congratulations! #{swimmer} has been registered to Event #{event_id} with starting time: #{time}\n "
end

def swimmer_events_age_gender_check
  puts "Input swimmer name for qualified events: "
  name = gets.chomp
#  search_by_swimmer_name(name)
  swimmer = Swimmer.find_by(name: name)
  puts "#{swimmer.name} #{swimmer.age} #{swimmer.gender}"
  swimmer_check_loop()
  events = Event.all
  qualified_events = events.where({ age: swimmer.age, gender: swimmer.gender })
  qualified_events.each do |qualified_event|
      qualified_event
      puts "__________________________________________________________\n"
      puts "   id:#{qualified_event.id}   | name:#{qualified_event.name} | age:#{qualified_event.age} | gender:#{qualified_event.gender_e} |"
    end
end

def swimmer_check_loop
  puts "Is this you? (y/n):"
  input = gets.chomp
  case input
  when "y"
    STDIN.getch
  when "n"
    puts "____________________\nNew swimmer search:"
    swimmer_events_age_gender_check()
  else
    puts "Invalid entry."
  end
end
