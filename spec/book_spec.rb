require_relative './book'
require_relative './persons'

describe Book do
  context 'inputing a book' do
    book1 = Book.new('Chebet', 'Desire of Ages')
    book2 = Book.new('Lilian', 'Kibet')

    it 'expects book1.title to be Chebet' do
      expect(book1.title).to eql 'Chebet'
    end
    it 'confirms if Book title is Lilian' do
      expect(book2.title).to eql 'Lilian'
    end
    it 'confirms if Book author is Kibet' do
      expect(book2.author).to eql 'Kibet'
    end
  end
end