require_relative '../book'
require_relative '../rental'
require 'date'


describe Book do
  let(:person) { Person.new('John Doe') } # Assuming you have a Person class

  context 'when creating a book' do
    let(:book1) { Book.new('Chebet', 'Desire of Ages') }
    let(:book2) { Book.new('Lilian', 'Kibet') }

    it 'expects book1.title to be Chebet' do
      expect(book1.title).to eql 'Chebet'
    end

    it 'expects book2.title to be Lilian' do
      expect(book2.title).to eql 'Lilian'
    end

    it 'expects book2.author to be Kibet' do
      expect(book2.author).to eql 'Kibet'
    end
  end

  context 'when renting a book' do
    let(:book) { Book.new('Title', 'Author') }
    let(:date) { Date.today }

    it 'adds a rental to the rentals array' do
      expect { book.rent_book(person) }.to change { book.rentals.length }.by(1)
    end

    it 'creates a rental with correct attributes' do
      book.rent_book(person)
      rental = book.rentals.first

      expect(rental.date).to eql date
      expect(rental.book).to eql book
      expect(rental.person).to eql person
    end
  end
end
