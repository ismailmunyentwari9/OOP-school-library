require_relative '../rental'

RSpec.describe Rental do
  let(:date) { '15-5-2023 ' }
  let(:book) { double('Book', rentals: []) }
  let(:person) { double('Person', rentals: []) }

  subject(:rental) { Rental.new(date, book, person) }

  describe '#initialize' do
    it 'sets the date correctly' do
      expect(rental.date).to eq(date)
    end

    it 'sets the book correctly' do
      expect(rental.book).to eq(book)
    end

    it 'sets the person correctly' do
      expect(rental.person).to eq(person)
    end

    it "adds the rental to the book's rentals array" do
      expect(book.rentals).to include(rental)
    end

    it "adds the rental to the person's rentals array" do
      expect(person.rentals).to include(rental)
    end

    it "does not add the rental to the book's rentals array if already present" do
      book.rentals << rental
      expect(book.rentals.count(rental)).to eq(2)
    end

    it "does not add the rental to the person's rentals array if already present" do
      person.rentals << rental
      expect(person.rentals.count(rental)).to eq(2)
    end
  end
end
