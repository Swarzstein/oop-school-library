require_relative '../classes/trimmer_decorator'
class Person
  def initialize(age, name = 'Unknown', id = SecureRandom.uuid, parent_permission: true)
    @id = id
    @name = name
    @age = age
    @parent_permission = parent_permission
    @rentals = []
  end
end

describe TrimmerDecorator do
  person_one = Person.new(31, 'IsraelChizungu')

  context 'Testing the Trimmer method' do
    it 'removes characters in a name if it too long' do
      trimmer_one = TrimmerDecorator.new(person_one)
      expect(trimmer_one.correct_name).to eql('IsraelChiz')
    end
  end
end
