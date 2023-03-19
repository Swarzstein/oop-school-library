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

  def clean_creen
    system("cls")
    system("clear")
  end

  def create_teacher
    puts "-creating a new teacher-"
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
      return false
    when 'Y'
      return true
    else
      permission?
    end
  end

  def create_student
    puts "-creating a new student-"
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
    clean_creen
    print "\Do you want to create a student (1) or a teacher (2)? [Input the number]: "
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
    clean_creen
    puts '-creating new book-'
    print 'Title: '
    title = gets.chomp
    print 'Author: '
    author = gets.chomp
    @books.push(Book.new(title, author))
  end

  def select_book
    puts 'Select a book from the list by [number]:'
    @books.each_with_index {|book, i| puts "[#{i}] #{book.title} by #{book.author}"}
    print "Enter [number]: "
    index = gets.chomp.to_i
    if @books[index]
      return @books[index]
    else
      select_book
    end
  end

  def select_person
    puts 'Select a person from the list by [number]:'
    @persons.each_with_index {|person, i| puts "[#{i}] [#{person.class.name}] ID: #{person.id} Name: #{person.name}"}
    print "Enter [number]: "
    index = gets.chomp.to_i
    if @persons[index]
      return @persons[index]
    else
      select_book
    end
  end

  def create_rental
    clean_creen
    book = select_book
    person = select_person
    print "insert date: "
    date = gets.chomp
    @rentals.push(Rental.new(date, book, person))
    puts "rental created successfully.\n"
  end

  def all_books
    @books.each_with_index {|book, i| puts "#{i+1} - #{book.title} by #{book.author}"}
  end

  def all_people
    @persons.each_with_index {|person, i| puts "#{i+1} - [#{person.class.name}] ID: #{person.id} Name: #{person.name}"}
  end

  def person_rentals
    clean_creen
    puts "select person's [ID]:"
    @persons.each {|person| puts "[#{person.id}] Name: #{person.name} [#{person.class.name}]"}
    print 'Enter ID: '
    id = gets.chomp.to_i
    persona = @persons.find {|person| person.id == id}
    if persona
      persona.rentals.each {|rental| puts "#{rental.date} - #{rental.person.name} - #{rental.book.title} by #{rental.book.author}"}
    else
      puts "The id #{id} doesn't exist"
    end
  end

  def menu
    clean_creen
    puts '######################'
    puts '# OOP SCHOOL LIBRARY #'
    puts '######################'
    puts "\nPlease choose an option by entering a number: "
    puts '1 - List all books.'
    puts '2 - List all people.'
    puts '3 - Create a person,'
    puts '4 - Create a book.'
    puts '5 - Create a rental.'
    puts '6 - List all rentals for a given person id.'
    puts '7 - Exit'

    op = gets.chomp.to_i
    if op>7
      menu
    end
    op
  end

  def wait
    gets.chomp
    puts ''
  end

  def start
    loop do
      option = menu

      case option
      when 1
        puts all_books
      when 2
        puts all_people
      when 3
        create_person
      when 4
        create_book
      when 5
        create_rental
      when 6
        puts person_rentals
      when 7
        break
      else

      end

      wait
    end
  end

end
