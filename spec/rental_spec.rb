require_relative '../rental'
require_relative '../book'
require_relative '../person'

describe Rental do
    let(:person) { Person.new(29, 'Chebet', []) }
  let(:book) { Book.new('benardo', 'Mary') }
  let(:date) { '2023/05/25' }
  let(:rental) { Rental.new(date, book, person) }

  it 'expects date for which book was rented to be 2023/05/25' do
    expect(rental.date).to eq '2023/05/25'
  end

  it 'expects name of person with a rented book to be Chebet' do
    expect(rental.person.name).to eq 'Chebet'
  end

  it 'expects the author of the rented book to be Mary' do
    expect(rental.book.author).to eq 'Mary'
  end
end
