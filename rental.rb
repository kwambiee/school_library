require './person'
require './book'

class Rental
  attr_accessor :date

  def initialize(person, book, date)
    @date = date
    @person = person
    @book = book
  end

  def book=(book)
    @book = book
    book.rentals << self unless book.rentals.include?(self)
  end

  def person=(person)
    @person = person
    person.rentals << self unless person.rentals.include?(self)
  end
end
