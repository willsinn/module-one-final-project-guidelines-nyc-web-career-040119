### Scrape Website and load db

 #helper
def input(value)
  # until input(value).to_a.include?("quit")
  value = self.input
  value
end
def confirm_submission
  print "press any key to confirm"
  STDIN.getch
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
  puts "2. Update the name of an existing Swimmer"
  puts "3. Create new Event"
  puts "4. Delete existing Event"
  puts "\n"

  input = gets.chomp.to_i
  case input
    when 1
        puts "____________________\nSearch swimmer name:"
        search_by_swimmer_name()
    when 2
        puts "____________________\nChange swimmer name:"
        get_params_for_name_update()
    when 3
        puts "____________________\nCreate new swim event:"
        create_event()
    when 4
        puts "____________________\nDelete an EMPTY swim event:"
       destroy_event()
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
      puts "\t#{swimmer.name}\t \t#{swimmer.age}\t \t#{swimmer.gender_string}\t     #{swimmer_event.name}     #{swimmer_time.time_minutes}\t"
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
#  binding.pry
  events.each do |event|
    event
    puts "#{event.id}#{event.name}#{event.age}#{event.gender}"
  end
   end

   #
   #    event.events
   #   if event == event.swim_event_times
   #   event_swimmers = event. {|swimmer| swimmer.swimmer.name }
   # puts "#{event_swimmers}"
   # event
   #    end
      #event.swim_event_times == undef




# end

#    e_id = Event.first.id
#   # e_swimmers = Event.first.swim_event_times
#   Swimmer.find_by(id: e_id)
#
#   binding.pry
#
# Event.swim_event_times.find_all()
#   counter = 1
#   puts "Full Event List"
#             Event.all.each do |event|
#             event.swim_event_times.map |swimmers|
#             # event.swim_event_times.all
#             event_id = event.swim_event_times.swimmer_id
#
#             Event.find_by(id: swimmer_id)
#
#             event_participants.find_all do |event_participants|
#             event_participants.swimmer.name
#             end
#            puts "#{counter}. #{event.id} #{event.name} #{event.age} #{event.gender} #{swimmers.swimmer.name} "
#            counter += 1
#          end
def destroy_event
  puts "target event for deletion: "
  event_id = gets.chomp
  target = Event.find_by(id: event_id)
binding.pry
  # confirm_submission

  target.destroy
  destroyed?(target)
  puts "Event: #{name} has been deleted."
end
