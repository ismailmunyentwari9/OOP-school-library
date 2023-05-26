require_relative '../base'
require_relative '../trimmer'

RSpec.describe TrimmerDecorator do
  let(:nameable_mock) { double('nameable') }
  let(:base_decorator) { BaseDecorator.new(nameable_mock) }
  let(:trimmer_decorator) { TrimmerDecorator.new(base_decorator) }

  describe '#correct_name' do
    context 'when the name is longer than 10 characters' do
      it 'calls the correct_name method of the nameable object and trims the result to 9 characters' do
        allow(nameable_mock).to receive(:correct_name).and_return('John Doe Smith')
        expect(trimmer_decorator.correct_name).to eq('John Doe ')
      end
    end

    context 'when the name is 10 characters or shorter' do
      it 'calls the correct_name method of the nameable object and returns the unmodified result' do
        allow(nameable_mock).to receive(:correct_name).and_return('John')
        expect(trimmer_decorator.correct_name).to eq('John')
      end
    end
  end
end
