require_relative 'relative'
class Book
  attr_accessor :title, :author, :rentals

  def initialize(title, author)
    @title = title
    @author = author
    @rentals = []
  end

  def rent_book(rental)
    rental= Rental.new(date, self, person)
    rentals << rental
  end
end
