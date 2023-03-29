require_relative 'nameable'
require 'json'

class Person < Nameable
  attr_accessor :name, :age, :rentals, :parent_permission
  attr_reader :id

  def initialize(age, name = 'Unknown', parent_permission: true)
    super()
    @id = rand(1..10_000)
    @name = name
    @age = age
    @parent_permission = parent_permission
    @rentals = []
  end

  private

  def of_age?
    @age >= 18
  end

  public

  def can_use_services?
    of_age? || parent_permission
  end

  def correct_name
    @name
  end

  def add_rental(rental)
    @rentals.push(rental)
    rental.person = self
    rental.book.rentals.push(rental) unless rental.book.rentals.include?(rental)
  end

  def to_json(*_args)
    hash = { class: self.class, id: @id, name: @name, age: @age, parent_permission: @parent_permission }
    hash.to_json
  end
end
