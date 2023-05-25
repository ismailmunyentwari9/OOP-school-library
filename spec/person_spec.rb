require_relative './book'
require_relative './persons'

describe Person do
  context 'contains names and ages' do
    person = Person.new(67, 'Chebet')

    it 'expects Chebet age to be 45' do
      expect(person.age).to eq 67
    end
    it 'expects Person.name to be Chebet' do
      expect(person.name).to eq 'Chebet'
    end

    it 'expect can_use_services to equal true' do
      expect(person.can_use_services?).to eq true
    end

    it 'expects a rental to be created' do
      expect(person.rental).to eql []
    end

    it 'expects the correct name to be given' do
      expect(person.correct_name).to eq 'Chebet'
    end
    it 'returns true if the person is of age' do
      expect(person.of_age?).to eq true
    end
    it 'returns false if the person is not of age' do
      person = Person.new(15, 'Grace', parent_permission: false)
      expect(person.of_age?).to eq false
    end
    it 'returns true if the person has parents permission' do
      person = Person.new(15, 'Grace', parent_permission: true)
      expect(person.can_use_services?).to eq true
    end
    it 'returns false if the person does not have parents permission' do
      person = Person.new(15, 'Grace', parent_permission: false)
      expect(person.can_use_services?).to eq false
    end
  end
end