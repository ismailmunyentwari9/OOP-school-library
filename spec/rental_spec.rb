require_relative './rental'
require_relative './persons'

describe Rental do
  context 'with an input of names and ages' do
    person = Person.new(29, 'Chebet')
    book = Book.new('benardo', 'Mary')
    rental = Rental.new('2023/05/25', book, person)

    it 'expects date for which book was rented to be 2023/01/02' do
      expect(rental.date).to eq '2023/05/25'
    end
    it 'expects name of student with a rented book to be Chebet' do
      expect(rental.person.name).to eq 'Chebet'
    end

    it 'expect the author of the rented book to be Mary' do
      expect(rental.book.author).to eq 'Mary'
    end
  end
end