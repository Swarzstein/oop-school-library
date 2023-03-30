require_relative '../classes/classroom'
require_relative '../classes/student'

describe Classroom do
  context 'Test classroom class' do
    it 'creating an instance object of classroom' do
      classroom = Classroom.new('Mathmatics')
      array = []
      expect(classroom).to be_instance_of(Classroom)
      expect(classroom.label).to eq('Mathmatics')
      expect(classroom.students).to eq(array)
    end
  end

  context 'Test the add students to the classroom' do
    it 'adds a student to the array' do
      classroom = Classroom.new('Languages')
      student = Student.new(22, 'israel')
      classroom.add_student(student)
      array = [student]
      expect(classroom.students).to eq(array)
    end
  end
end
