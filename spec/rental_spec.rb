require_relative '../classes/book'
require_relative '../classes/person'
require_relative '../classes/rental'

describe Rental do
  firstPerson = Person.new(22, 'israel ch')
  book1 = Book.new('Dead men no tell', 'Jack Sparrow')
  rental = Rental.new('2023-02-08', book1, firstPerson)

  context 'Testing the Rental class' do
    it 'creating an instance of the rental class' do
      expect(rental).to be_instance_of(Rental)
    end
  end
end
