require_relative '../classes/book'

module BookCreator
  def create_libro
    puts '-creating new book-'
    print 'Title: '
    title = gets.chomp
    print 'Author: '
    author = gets.chomp
    Book.new(title, author)
  end
end
