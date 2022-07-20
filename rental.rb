class Rental
  attr_accessor :date
  attr_reader :person, :book

  def initialize(date, person, book)
    @date = date
    @person = person
    book.rental.push(self) unless book.rental.includes?(self)
    @book = book
     person.rental.push(self) unless person.rental.includes?(self)
  end
end
