require_relative '../classes/classroom'

class Person
  def initialize(age, name = 'Unknown', id = SecureRandom.uuid, parent_permission: true)
    @id = id
    @name = name
    @age = age
    @parent_permission = parent_permission
    @rentals = []
  end
end

class Student < Person
  attr_reader :classroom

  def initialize(age, name = 'Unknown', id = nil, parent_permission: true)
    super(age, name, id, parent_permission: parent_permission)
    @classroom = nil
  end

  def play_hooky
    '¯\(ツ)/¯'
  end

  def classroom=(classroom)
    @classroom = classroom
    classroom.students.push(self) unless classroom.students.include?(self)
  end
end

describe Classroom do
  context 'Test classroom class' do
    it 'creating an instance object of classroom' do
      classroom = Classroom.new('Mathematics')
      array = []
      expect(classroom).to be_instance_of(Classroom)
      expect(classroom.label).to eq('Mathematics')
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
