require_relative 'classes/book'
require_relative 'classes/person'
require_relative 'classes/teacher'
require_relative 'classes/student'
require_relative 'classes/rental'

class App
  def initialize
    @books = []
    @persons = []
    @rentals = []
  end

  def clear_screen
    system('cls')
    system('clear')
  end

  def create_teacher
    puts '-creating a new teacher-'
    print 'Name: '
    name = gets.chomp
    print 'Age: '
    age = gets.chomp.to_i
    print 'specialization: '
    spec = gets.chomp
    @persons.push(Teacher.new(age, spec, name))
    puts "Person created successfully\n"
  end

  def permission?
    print "Has parents' permission? [Y/N]: "
    option = gets.chomp.capitalize
    case option
    when 'N'
      false
    when 'Y'
      true
    else
      permission?
    end
  end

  def create_student
    puts '-creating a new student-'
    print 'Name: '
    name = gets.chomp
    print 'Age: '
    age = gets.chomp.to_i
    permission = true
    permission = permission? if age < 18
    @persons.push(Student.new(age, name, parent_permission: permission))
    puts "Person created successfully\n"
  end

  def create_person
    clear_screen
    print 'Do you want to create a student (1) or a teacher (2)? [Input the number]: '
    option = gets.chomp.to_i
    case option
    when 1
      create_student
    when 2
      create_teacher
    else
      create_person
    end
  end

  def create_book
    clear_screen
    puts '-creating new book-'
    print 'Title: '
    title = gets.chomp
    print 'Author: '
    author = gets.chomp
    @books.push(Book.new(title, author))
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
    @persons.each_with_index { |person, i| puts "[#{i}] [#{person.class.name}] ID: #{person.id} Name: #{person.name}" }
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
