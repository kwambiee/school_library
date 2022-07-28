require './person'
require './book'

class Rental
  attr_accessor :date, :person, :book

  def initialize(person, book, date)
    @date = date
    @person = person
    @book = book
  end
end
