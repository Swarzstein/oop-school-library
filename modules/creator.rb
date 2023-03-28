require_relative '../classes/teacher'
require_relative '../classes/student'
require_relative '../classes/book'

module Creator
  private

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
    Student.new(age, name, parent_permission: permission)
  end

  def create_teacher
    puts '-creating a new teacher-'
    print 'Name: '
    name = gets.chomp
    print 'Age: '
    age = gets.chomp.to_i
    print 'specialization: '
    spec = gets.chomp
    Teacher.new(age, spec, name)
  end

# private methods used for rental

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

  public

  def create_new_person
    print 'Do you want to create a student (1) or a teacher (2)? [Input the number]: '
    option = gets.chomp.to_i
    case option
    when 1
      create_student
    when 2
      create_teacher
    else
      create
    end
  end

  def create_new_book
    puts '-creating new book-'
    print 'Title: '
    title = gets.chomp
    print 'Author: '
    author = gets.chomp
    Book.new(title, author)
  end

  # create rentals
  
end
