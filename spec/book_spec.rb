require_relative '../book'

describe Book do
  describe '#initialize' do
    it 'creates a new instance of Book with the given title and author' do
      title = 'Title'
      author = 'Author'

      book = described_class.new(title, author)

      expect(book.title).to eq(title)
      expect(book.author).to eq(author)
      expect(book.rentals).to be_empty
    end
  end
end
