require_relative 'person'
require 'securerandom'

class Student < Person
  attr_reader :classroom

  def initialize(age, name = 'Unknown', id = SecureRandom.uuid, parent_permission: true)
    super(age, name, id, parent_permission: parent_permission)
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
