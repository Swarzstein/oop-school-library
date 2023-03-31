require_relative '../classes/rental'

class Person
  attr_accessor :name, :age, :rentals, :parent_permission
  attr_reader :id

  def initialize(age, name = 'Unknown', id = nil, parent_permission: true)
    super()
    @id = id
    @name = name
    @age = age
    @parent_permission = parent_permission
    @rentals = []
  end
end

class Book
  attr_accessor :title, :author, :rentals

  # attr_reader :rentals

  def initialize(title, author)
    @title = title
    @author = author
    @rentals = []
  end
end

describe Rental do
  person = Person.new(22, 'israel ch')
  book = Book.new('Dead men no tell', 'Jack Sparrow')
  rental = Rental.new('2023-02-08', book, person)

  context 'Testing the Rental class' do
    it 'creating an instance of the rental class' do
      expect(rental).to be_instance_of(Rental)
    end
  end

  context 'Test the to_json method in Rental' do
    it 'passes the info as a json format to store' do
      json_sample_data = '{"date":"2023-02-08",' \
                         '"book":{"title":"Dead men no tell","author":"Jack Sparrow"},' \
                         '"person":{"class":"Person","id":null,"name":"israel ch","age":22,"parent_permission":true}}'
      rental_obj = rental.to_json
      expect(rental_obj).to eq(json_sample_data)
    end
  end
end
