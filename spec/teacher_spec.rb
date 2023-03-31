require_relative '../classes/teacher'

describe Teacher do
  context 'When testing the Teacher class' do
    teacher1 = Teacher.new(15, 'History')
    teacher2 = Teacher.new(15, 'History', 'Augusto', parent_permission: false)
    it "Should return 'Unknown' if we check the name when instanciated only with age" do
      expect(teacher1.name).to eq 'Unknown'
    end
    it "Should return 'Augusto' if we check the name" do
      expect(teacher2.name).to eq 'Augusto'
    end
    it "Should return 'History' if we check the specialization" do
      expect(teacher2.specialization).to eq 'History'
    end
    it 'Should return true when checking use of service even if instanciated with permission as false and <18' do
      expect(teacher2.can_use_services?).to eq true
    end
    it 'Should return true when checking use of service if instanciated with permission as false and <18' do
      expect(teacher2.can_use_services?).to eq true
    end
    it "Should return '3' if we check the person's rentals after adding 3 rentals" do
      teacher2.rentals.push('rent', 'rent', 'rent')
      expect(teacher2.rentals.length).to eq 3
    end
  end
end
