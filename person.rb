require_relative 'nameable'
require_relative 'rental'

class Person < Nameable
  attr_accessor :id, :name, :age, :rentals

  def initialize(age, name: 'Unknown', parent_permission: true)
    super(name)
    @id = Random.rand(1..1000)
    @name = name
    @age = age
    @parent_permission = parent_permission
    @rentals = []
  end

  private

  def of_age?
    @age >= 18
  end

  public

  def can_use_services?
    of_age? || @parent_permission
  end

  def correct_name
    @name
  end

  def rent_person(date, book)
    rental = Rental.new(date, self, book)
    rentals << rental
  end
end
