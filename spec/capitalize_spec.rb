require_relative '../classes/decorator'
require_relative '../classes/capitalize'
require_relative '../classes/person'
require_relative '../classes/teacher'
require_relative '../classes/student'

describe CapitalizeDecorator do
  context 'Test the capitalize decorator' do
    it 'capitalize the first letter of the class Person, Student and Teacher' do
      person = Person.new(34, 'israel')
      teacher = Teacher.new(23, 'Math', name: 'modulo')
      student = Student.new(43, 'arthur')
      person_capitalize = CapitalizeDecorator.new(person)
      teacher_capitalize = CapitalizeDecorator.new(teacher)
      student_capitalize = CapitalizeDecorator.new(student)
      expect(person_capitalize.correct_name).to eq('Israel')
      expect(teacher_capitalize.correct_name).to eq('Modulo')
      expect(student_capitalize.correct_name).to eq('Arthur')
    end
  end
end
