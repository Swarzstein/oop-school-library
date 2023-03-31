require_relative '../classes/person'

describe Person do
  person1 = Person.new(15, 'Augusto')
  person2 = Person.new(15, 'Augusto', parent_permission: false)
  person3 = Person.new(15)
  person4 = Person.new(20, 'Augusto', parent_permission: false)
  context 'When testing the Person class' do
    it "Should return 'Unknown' if we check the name when instanciated only with age" do
      expect(person3.name).to eq 'Unknown'
    end
    it "Should return 'Augusto' if we check the name" do
      expect(person1.name).to eq 'Augusto'
    end
    it 'Should return 15 if we check the age' do
      expect(person1.age).to eq 15
    end
    it "Should return 0 if we check the person's rentals without any rental" do
      expect(person1.rentals.length).to eq 0
    end
    it 'Returns false when checking use of service if instanciated with permission as false and age < 18' do
      expect(person2.can_use_services?).to eq false
    end
    it 'Returns true when checking use of service if instanciated with permission as false and age +18' do
      expect(person4.can_use_services?).to eq true
    end
    it 'Converts data into json format ' do
      json_sample_data = '{"class":"Person","id":null,"name":"israel ch","age":22,"parent_permission":true}'
      person_obj = person1.to_json
      def valid_json?(value)
        result = JSON.parse(value)

        result.is_a?(Hash) || result.is_a?(Array)
      rescue JSON::ParserError, TypeError
        false
      end
      expect(valid_json?(person_obj)).to eq(valid_json?(json_sample_data))
    end
  end
end
