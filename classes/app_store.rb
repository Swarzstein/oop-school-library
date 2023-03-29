require 'date'
require_relative 'person'
require_relative 'student'
require_relative 'teacher'
require_relative 'rental'
require_relative 'book'

module Store
  def save_data
    save_books
    save_people
    save_rentals
  end

  def save_books
    File.open('store/books.json', 'w') { |s| s << @books.to_json }
  end

  def save_people
    File.open('store/people.json', 'w') { |s| s << @people.to_json }
  end

  def save_rentals
    File.open('store/rentals.json', 'w') { |s| s << @rentals.to_json }
  end

  def load_data
    load_books
    load_people
    load_rentals
  end

  def load_books
    return unless File.exist?('store/books.json') && File.size?('store/books.json')

    store = JSON.parse(File.read('store/books.json'))
    store.map { |book| @books.push(Book.new(book['title'], book['author'])) }
  end

  def load_people
    return unless File.exist?('store/people.json') && File.size?('store/people.json')

    store = JSON.parse(File.read('store/people.json'))
    store.map do |people|
      if people['class'] == 'Student'
        @people.push(Student.new(people['age'], people['name'], people['id'],
                                 parent_permission: people['parent_permission']))
      else
        @people.push(Teacher.new(people['age'], people['specialization'], people['name'], people['id'],
                                 parent_permission: people['parent_permission']))
      end
    end
  end

  def load_rentals
    return unless File.exist?('store/rentals.json') && File.size?('store/rentals.json')

    JSON.parse(File.read('store/rentals.json')).each do |rental|
      rental_book = @books.find { |book| book.title == rental['book']['title'] }
      rental_people = @people.find { |person| person.id == rental['person']['id'] }
      @rentals.push(Rental.new(rental['date'], rental_book, rental_people))
    end
  end
end
