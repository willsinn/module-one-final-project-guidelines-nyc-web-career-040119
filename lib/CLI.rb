### Scrape Website and load db

 #helper
def start
  puts "\n Welcome to Swim-Meet-DB.\n Meet management made easy!"
  main_menu()
end

def input
  value = self.input
  value
  if value == "q"
    return
  end
end
#######################################
############ MAIN
def main_menu
  puts "***********************************************************"
  puts "SM-DB: Main-Menu"
  puts "\n"
  puts "1. Swimmer management console"
  puts "2. List active events "
  puts "3. Create new event"
  puts "4. Delete an empty event"
  puts "\n"
  puts "***********************************************************"


  input = gets.chomp.to_i
  case input
    when 1
        puts "***********************************************************"
        swimmer_domain()
    when 2
        puts "___________________________________________________________"
        event_list()
    when 3
        puts "___________________________________________________________\nCreate new swim event:"
        create_event()
    when 4
        puts "___________________________________________________________\nDelete an EMPTY swim event:"
        event_list()
        destroy_event_swimmer_check()
     else
       puts "Invalid entry."
     end
     main_menu()

   end
###How would I see all the Events I participated in and how would I see my fastest time?






##Return Swimmer's Event and Record Swim

def create_event
  puts " <=| new event name: "
  name = gets.chomp
  puts " <=| event age group: "
  age = gets.chomp
  puts " <=| event gender group: "
  gender = gets.chomp
  Event.find_or_create_by(name: name, age: age, gender: gender)
  puts " + success! event created: #{name} | #{age} | #{gender}\n "
end

def event_list
  events = Event.all
  puts "\tCurrent Active Events"
  events.each do |event|
    event
    puts "__________________________________________________________\n"
    puts "   id:#{event.id}   | name:#{event.name} | age:#{event.age} | gender:#{event.gender_e} |"
  end
end




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
  puts " + success! event deleted: #{id} |=>"
end

def confirm_destroy
  print "CONFIRM DESTROY?\nACTION MAY BE PERMANENT"
  STDIN.getch
end






###############################################################
###################SWIMMER DOMAIN

def swimmer_domain
  puts "***********************************************************"
  puts "Swimmer Console:"
  puts "\n"
  puts "1. Create new Swimmer"
  puts "2. Search for an existing Swimmer"
  puts "3. Update the name of an existing Swimmer"
  puts "4. Register swimmer to event, event id required"
  puts "5. Main Menu"
  puts "\n"
  puts "***********************************************************"
  input = gets.chomp.to_i
  case input
    when 1
        puts "Create new swimmer:\n==================="
        create_swimmer()
    when 2
        puts "Search existing swimmer:\n======================="
        search_by_swimmer_name()
    when 3
        puts "Change existing swimmer name:\n==========================="
        get_params_for_name_update()
    when 4
        puts "Register swimmer to qualifying event:\n================================="
        swimmer_events_qualifying_list()
    when 5
        main_menu()
    else
       puts " **ERROR: invalid entry.**"
    end
    swimmer_domain()
end
############# SWIMMER SEARCH

def search_by_swimmer_name
    swimmer_name = gets.chomp
    swimmer = Swimmer.find_by(name: swimmer_name)
      if swimmer == nil
        puts " **ERROR: no swimmer by that name.**"
        search_again_helper()
      end
    registered_events = SwimEventTime.find_by(id: swimmer.id)
    swimmer_event = Event.find_by(id: registered_events.event_id )

      puts " ***Search Result |=> "
      puts "_______________________________________________________________________________________"
      puts "|\tName\t  |\tAge\t|\tGender\t  | \tEvent\t   |\tTime\t|"
      puts "_______________________________________________________________________________________"
      puts "\t#{swimmer.name}\t \t#{swimmer.age}\t \t#{swimmer.gender_s}\t     #{swimmer_event.name}     #{registered_events.time_minutes}\t"
      puts "_______________________________________________________________________________________"
      search_again_helper()
end

def search_again_helper
  puts " <=| search again? (y/n)\n(n) exits to main-menu"
  input = gets.chomp
  case input
  when "y"
    puts "================\nswimmer search:"
    search_by_swimmer_name()
  when "n"
    puts "...ending search."
    main_menu()
  else
    puts " **ERROR: invalid entry.**"
  end
end
##############################################
#CREATE SWIMMER

def create_swimmer
  puts " <=| new swimmer name: "
  name = gets.chomp
  puts " <=| swimmer age group: "
  age = gets.chomp
  puts " <=| swimmer gender group: "
  gender = gets.chomp
  Swimmer.find_or_create_by(name: name, age: age, gender: gender)
  puts "  + success! swimmer created: #{name} | #{age} | #{gender} |=> "
  swimmer_domain()
end
################################################
## UPDATE SWIMMER NAME
def get_params_for_name_update
  puts "current name:"
  name = gets.chomp
  swimmer = Swimmer.find_by(name: name)
    if swimmer == nil
      puts " **ERROR: no swimmer by that name, try again.**"
      get_params_for_name_update()
    end
  puts " <=| new name:"
  new_name = gets.chomp
  update_swimmer_name(name, new_name)
end

def update_swimmer_name(name, new_name)
  if name == new_name
    binding.pry
    puts "Values are the same, try again."
    get_params_for_name_update()
  end
  swimmer_update = Swimmer.find_by(name: name)
  swimmer_update.update(name: new_name)
  puts "  + success! swimmer name:'#{name}', changed to: '#{new_name}' |=> "
  swimmer_domain()
end

####################################################
########## REGISTER SWIMMER TO EVENT


#SWIMMER EVENT LIST

def swimmer_events_qualifying_list
  puts " <=| enter swimmer for qualifying events: "
  name = gets.chomp
  swimmer = Swimmer.find_by(name: name)
    if swimmer == nil
      puts "**ERROR: No swimmer by that name, try again.**"
      swimmer_events_qualifying_list()
    end
    puts "__________________________________________________________\n"
    puts " Swimmer ID:#{swimmer.id}  |  Name:#{swimmer.name}  |  Age:#{swimmer.age}  |  Gender:#{swimmer.gender_s}"
    puts "__________________________________________________________\n"
    swimmer_check_loop()
    events = Event.all
    qualified_events = events.where({ age: swimmer.age, gender: swimmer.gender })
    qualified_events.each do |qualified_event|
      qualified_event
      puts "__________________________________________________________\n"
      puts " Event ID:#{qualified_event.id}   | name:#{qualified_event.name} | age:#{qualified_event.age} | gender:#{qualified_event.gender_e} |"
      puts "__________________________________________________________\n"
      puts "**"

    end
    register_swimmer_to_event()
end

def swimmer_check_loop
  puts " <=| Is this you? (y/n):"
  input = gets.chomp
  case input
  when "y"
    STDIN.getch
  when "n"
    puts "New swimmer search:"
    puts "===================="
    swimmer_events_qualifying_list()
  else
    puts " **ERROR: invalid entry.**"
  end
end

# REGISTER SWIMMER TO EVENT
def register_swimmer_to_event
  events = Event.all
  puts "Register swimmer to event:"
  puts "==========================="
  puts " <=| enter swimmer name:"
  swimmer_id = gets.chomp
  puts " <=| enter event id:"
  event_id = gets.chomp
    if events.include?(event_id)
      puts " **ERROR: already registered, try another event**"
      register_swimmer_to_event()
    end
  puts " <=| enter starting time:"
  time = gets.chomp
  SwimEventTime.find_or_create_by(swimmer_id: swimmer_id, event_id: event_id, time: time)
  puts " + success! swimmer registered: s_id:#{swimmer_id.name} | e_id:#{event_id.name} | t:#{time} |=>"
  swimmer_domain()
end
