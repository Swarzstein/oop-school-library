require_relative 'classes/book'
# require_relative 'classes/person'
# require_relative 'classes/teacher'
# require_relative 'classes/student'
require_relative 'classes/rental'
require_relative 'modules/creator'

class App
  include Creator
  def initialize
    @books = []
    @persons = []
    @rentals = []
  end

  def clear_screen
    system('cls')
    system('clear')
  end

  def create_person
    clear_screen
    @persons.push(create_new_person)
    puts "Person created successfully\n"
  end

  def create_book
    clear_screen
    @books.push(create_new_book)
    puts "Book created successfully\n"
  end

  def select_book
    puts 'Select a book from the list by [number]:'
    @books.each_with_index { |book, i| puts "[#{i}] #{book.title} by #{book.author}" }
    print 'Enter [number]: '
    index = gets.chomp.to_i
    return @books[index] if @books[index]

    select_book
  end

  def select_person
    puts 'Select a person from the list by [number]:'
    @persons.each_with_index do |person, i|
      puts "[#{i}] [#{person.class.name}] ID: #{person.id} Name: #{person.name}"
    end
    print 'Enter [number]: '
    index = gets.chomp.to_i
    return @persons[index] if @persons[index]

    select_person
  end

  def create_rental
    clear_screen
    if @books.empty?
      puts 'There are no books to rent'
    elsif @persons.empty?
      puts 'There are no persons registered to rent a book'
    else
      puts '-creating new rental-'
      book = select_book
      person = select_person
      print 'insert date: '
      date = gets.chomp
      @rentals.push(Rental.new(date, book, person))
      puts "rental added successfully.\n"
    end
  end

  def all_books
    clear_screen
    if @books.length >= 1
      @books.each_with_index { |book, i| puts "#{i + 1} - #{book.title} by #{book.author}" }
    else
      puts "There's no book registered"
    end
  end

  def all_people
    clear_screen
    if @persons.length >= 1
      @persons.each_with_index do |person, i|
        puts "#{i + 1} - [#{person.class.name}] ID: #{person.id} Name: #{person.name}"
      end
    else
      puts "There's no person registered"
    end
  end

  def persona_of_id(id)
    @persons.find { |person| person.id == id }
  end

  def select_id
    puts "select person's [ID]:"
    @persons.each { |person| puts "[#{person.id}] Name: #{person.name} [#{person.class.name}]" }
    print 'Enter ID: '
    gets.chomp.to_i
  end

  def person_rentals
    clear_screen
    if @persons.length >= 1
      id = select_id
      persona = persona_of_id(id)
      if persona
        if persona.rentals.length >= 1
          persona.rentals.each do |rental|
            puts "#{rental.date} - #{rental.person.name} - #{rental.book.title} by #{rental.book.author}"
          end
        else
          puts "This person has't rented any book"
        end
      else
        puts "The ID #{id} doesn't exist"
      end
    else
      puts "There's no person registered"
    end
  end
end
