class Book
  attr_accessor :title, :author, :rentals

  def initialize(title, author)
    @title = title
    @author = author
  end

  def add_rental(rental)
    @rentals << rental
    rental.book = self
  end
end
