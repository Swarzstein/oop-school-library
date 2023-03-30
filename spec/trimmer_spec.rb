require_relative '../classes/trimmer'
require_relative '../classes/teacher'

describe TrimmerDecorator do
  teacher_one = Teacher.new(31, name: 'IsraelChizungu')
  teacher_two = Teacher.new(17, name: 'modulo')

  context 'Testing the Trimmer method' do
    it 'removes characters in a name if it too long' do
      trimmer_one = TrimmerDecorator.new(teacher_one)
      trimmer_two = TrimmerDecorator.new(teacher_two)
      expect(trimmer_one.correct_name).to eql('IsraelC')
      expect(trimmer_two.correct_name).to eql('modulo')
    end
  end
end
