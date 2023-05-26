require_relative '../person'

RSpec.describe Person do
  let(:age) { 20 }
  let(:name) { 'John Doe' }
  let(:parent_permission) { true }

  subject(:person) { Person.new(age, name: name, parent_permission: parent_permission) }

  describe '#initialize' do
    it 'sets the age correctly' do
      expect(person.age).to eq(age)
    end

    it 'sets the name correctly' do
      expect(person.name).to eq(name)
    end

    it 'initializes an empty rentals array' do
      expect(person.rentals).to be_empty
    end
  end

  describe '#can_use_services?' do
    context 'when the person is of age' do
      let(:age) { 25 }

      it 'returns true' do
        expect(person.can_use_services?).to eq(true)
      end
    end

    context 'when the person is not of age' do
      let(:age) { 15 }

      it 'returns the parent permission status' do
        expect(person.can_use_services?).to eq(parent_permission)
      end
    end
  end

  describe '#correct_name' do
    it 'returns the correct name' do
      expect(person.correct_name).to eq(name)
    end
  end

  describe '#rent_person' do
    let(:date) { ' 15-5-2023' }
    let(:book) { double('Book') }

    it 'creates a new rental with the person and book' do
      expect(Rental).to receive(:new).with(date, person, book).and_return(double('Rental'))
      person.rent_person(date, book)
    end

    it 'adds the rental to the rentals array' do
      rental = double('Rental')
      allow(Rental).to receive(:new).and_return(rental)
      person.rent_person(date, book)
      expect(person.rentals).to include(rental)
    end
  end
end
