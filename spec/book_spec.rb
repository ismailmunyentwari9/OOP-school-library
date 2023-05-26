require_relative '../book'
require_relative '../rental'

RSpec.describe Book do
  let(:title) { 'The Great Gatsby' }
  let(:author) { 'F. Scott Fitzgerald' }
  let(:book) { Book.new(title, author) }
  let(:person) { double('Person') }
  let(:date) { '2023-5-26' }

  describe '#initialize' do
    it 'sets the title, author, and rentals attributes' do
      expect(book.title).to eq(title)
      expect(book.author).to eq(author)
      expect(book.rentals).to be_an(Array)
      expect(book.rentals).to be_empty
    end
  end

  describe '#rent_book' do
    it "creates a new Rental object and adds it to the rentals array" do
      expect(Rental).to receive(:new).with(date, book, person) do
        instance_double(Rental, date: date, book: book, person: person)
      end

      book.rent_book(date, person)

      expect(book.rentals.length).to eq(1)
    end

    it "does not add a rental to the rentals array if it is already present" do
      rental = instance_double(Rental, date: date, book: book, person: person)
      allow(Rental).to receive(:new).and_return(rental)

      book.rent_book(date, person)
      book.rent_book(date, person)
    end
  end
end
