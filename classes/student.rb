require_relative 'person'

class Student < Person
  attr_reader :classroom

  def initialize(age, _classroom, name = 'Unknown', parent_permission: true)
    super(age, name: name, parent_permission: parent_permission)
    @classroom = nil
  end

  def play_hooky
    '¯\(ツ)/¯'
  end

  def classroom=(classroom)
    @classroom = classroom
    classroom.student.push(self) unless classroom.students.includes?(self)
  end
end
