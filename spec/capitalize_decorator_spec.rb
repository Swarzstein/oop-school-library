require_relative '../classes/capitalize_decorator'

class Person < Nameable
  def initialize(age, name = 'Unknown', id = SecureRandom.uuid, parent_permission: true)
    super()
    @id = id
    @name = name
    @age = age
    @parent_permission = parent_permission
    @rentals = []
  end
end

describe CapitalizeDecorator do
  context 'Test the capitalize decorator' do
    it 'capitalize the first letter of the class Person, Student and Teacher' do
      person = Person.new(34, 'israel')
      person_capitalize = CapitalizeDecorator.new(person)
      expect(person_capitalize.correct_name).to eq('Israel')
    end
  end
end
