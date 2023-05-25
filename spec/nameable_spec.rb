require_relative '../nameable'

RSpec.describe Nameable do
  let(:name) { 'John Doe' }

  subject(:nameable) { described_class.new(name) }

  describe '#initialize' do
    it 'sets the name correctly' do
      expect(nameable.instance_variable_get(:@name)).to eq(name)
    end
  end

  describe '#correct_name' do
    it 'raises NotImplementedError' do
      expect { nameable.correct_name }.to raise_error(NotImplementedError)
    end
  end
end
