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
end
