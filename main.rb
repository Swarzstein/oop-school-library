require_relative 'app'

def menu
  system('cls')
  system('clear')
  puts '######################'
  puts '# OOP SCHOOL LIBRARY #'
  puts '######################'
  puts "\nPlease choose an option by entering a number: "
  puts '1 - List all books.'
  puts '2 - List all people.'
  puts '3 - Create a person.'
  puts '4 - Create a book.'
  puts '5 - Create a rental.'
  puts '6 - List all rentals for a given person id.'
  puts '7 - Exit'
  op = gets.chomp.to_i
  menu unless op < 8 && op.positive?
  op
end

def wait
  puts "\npress enter to continue"
  gets.chomp
end

def start
  app = App.new
  loop do
    case menu
    when 1
      app.all_books
    when 2
      app.all_people
    when 3
      app.create_person
    when 4
      app.create_book
    when 5
      app.create_rental
    when 6
      app.person_rentals
    else
      break
    end
    wait
  end
end

def main
  start
  save_data
  puts 'Thank you for using this app!'
  wait
  system('cls')
  system('clear')
end

main
