require_relative './book'
require_relative './persons'

describe Book do
  context 'inputing a book' do
    book1 = Book.new('Caren Siya', 'The Whale Rider')
    book2 = Book.new('Isma', 'Promise')

    it 'expects book1.title to be Caren Siya' do
      expect(book1.title).to eql 'Caren Siya'
    end
    it 'confirms if Book title is Isma' do
      expect(book2.title).to eql 'Isma'
    end
    it 'confirms if Book author is Promise' do
      expect(book2.author).to eql 'Promise'
    end
  end
end