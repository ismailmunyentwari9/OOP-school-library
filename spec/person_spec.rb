require_relative '../person'

describe Person do
  context 'contains names and ages' do
    let(:person) { Person.new(67, 'Chebet', []) }

    it 'expects person.age to be 67' do
      expect(person.age).to eq 67
    end

    it 'expects person.name to be Chebet' do
      expect(person.name).to eq 'Chebet'
    end

    it 'expects person.can_use_services? to be true' do
      expect(person.can_use_services?).to eq true
    end

    it 'expects person.rental to be an empty array' do
      expect(person.rental).to eql []
    end

    it 'expects person.correct_name to be Chebet' do
      expect(person.correct_name).to eq 'Chebet'
    end

    it 'returns true if the person is of age' do
      expect(person.of_age?).to eq true
    end

    it 'returns false if the person is not of age' do
      person = Person.new(15, 'Grace', parent_permission: true)
      expect(person.of_age?).to eq false
    end

    it 'returns true if the person has parent permission' do
      person = Person.new(15, 'Grace', [], parent_permission: true)
      expect(person.can_use_services?).to eq true
    end

    it 'returns false if the person does not have parent permission' do
      person = Person.new(15, 'Grace', parent_permission: false)
      expect(person.can_use_services?).to eq false
    end
  end
end
