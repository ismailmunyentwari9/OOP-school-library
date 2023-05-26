require_relative '../nameable'
require_relative '../base'

RSpec.describe BaseDecorator do
  let(:nameable_mock) { double('nameable') }
  let(:base_decorator) { BaseDecorator.new(nameable_mock) }

  describe '#initialize' do
    it 'assigns the nameable object' do
      expect(base_decorator.instance_variable_get(:@nameable)).to eq(nameable_mock)
    end
  end

  describe '#correct_name' do
    it 'calls the correct_name method of the nameable object' do
      expect(nameable_mock).to receive(:correct_name)
      base_decorator.correct_name
    end
  end
end
