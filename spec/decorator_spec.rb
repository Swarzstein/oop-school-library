require_relative '../classes/decorator'
require_relative '../classes/nameable'

describe Decorator do
  context 'Test the Decorator class' do
    it 'create an instance object of decorator' do
      decorator = Decorator.new('israel')
      expect(decorator).to be_instance_of(Decorator)
      expect(decorator.nameable).to eq('israel')
    end
  end
end
