require 'json'

class Book
  attr_accessor :title, :author, :rentals

  # attr_reader :rentals

  def initialize(title, author)
    @title = title
    @author = author
    @rentals = []
  end

  def add_rental(rental)
    @rentals.push(rental)
    rental.book = self
    rental.person.rentals.push(rental) unless rental.person.rentals.include?(rental)
  end

  def to_json(*_args)
    hash = { title: @title, author: @author }
    hash.to_json
  end
end
