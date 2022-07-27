require './person'
require './book'

class Rental
  attr_accessor :date, :person, :book
  # attr_reader :person, :book

  def initialize(date, person, book)
    # @date = date
    # @person = person
    # book.rentals << self
    # @book = book
    # person.rentals << self
    # @author = book.author
    # @title = book.title
       @person_name= person.name
       @person_age= person.age
       @book_title= book.title
       @book_author= book.author
       @date= date

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

# new = Rental.new('2020-01-01', 'John', 'Harry Potter')
book = Book.new('Harry Potter', 'J.K. Rowling')
person = Person.new(20, 'John', true)
new = Rental.new('2020-01-01', person, book)
p new