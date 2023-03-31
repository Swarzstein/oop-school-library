require_relative '../classes/student'

class Classroom
  attr_accessor :label
  attr_reader :students

  def initialize(label)
    @label = label
    @students = []
  end
end

describe Student do
  context 'When testing the Student class' do
    student1 = Student.new(19, 'Augusto', parent_permission: false)
    student2 = Student.new(15, 'Augusto', parent_permission: false)
    it "Should return 'Augusto' if we check the name" do
      expect(student1.name).to eq 'Augusto'
    end
    it "Should return 'nil' if we check the classroom before assigning it" do
      expect(student1.classroom).to eq nil
    end
    it "Should return false when checking parents' permission  if instanciated with permission as false" do
      expect(student2.parent_permission).to eq false
    end
    it 'Should return false when checking use of service if instanciated with permission as false and < 18' do
      expect(student2.can_use_services?).to eq false
    end
    it "Should return '3' if we check the student's rentals after adding 3 rentals" do
      student2.rentals.push('rent', 'rent', 'rent')
      expect(student2.rentals.length).to eq 3
    end
    it 'Should return ¯\\(ツ)/¯ when calling play_hooky' do
      expect(student1.play_hooky).to eq '¯\(ツ)/¯'
    end
    it 'Should add a classroom when calling classroom=(classroom)' do
      classroom = Classroom.new('Biology')
      student1.classroom = classroom
      expect(student1.classroom).to eq classroom
      expect(classroom.students).to eq [student1]
    end
  end
end
