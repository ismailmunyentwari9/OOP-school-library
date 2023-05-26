require_relative '../base'
require_relative '../capitalize'

RSpec.describe CapitalizeDecorator do
  let(:nameable_mock) { double('nameable') }
  let(:base_decorator) { BaseDecorator.new(nameable_mock) }
  let(:capitalize_decorator) { CapitalizeDecorator.new(nameable_mock) }

  describe '#correct_name' do
    it 'calls the correct_name method of the nameable object and capitalizes the result' do
      allow(nameable_mock).to receive(:correct_name).and_return('john doe')
      expect(capitalize_decorator.correct_name).to eq('John doe')
    end
  end
end
