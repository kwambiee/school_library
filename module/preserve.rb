require 'json'

module PreserveData
  def load_persons
    file = open('./data/people.json')
    persons = JSON.parse(file.read)
    person_list = []

    unless persons['people'].empty?
      persons['people'].each do |person|
        case person['class']
        when 'Teacher'
          person_list << Teacher.new(person['name'], person['age'], person['specialization'])

        when 'Student'
          person_list << Student.new(person['age'], person['name'], parent_permission: person['parent_permission'])
        end
      end
    end

    person_list
  rescue StandardError
    puts 'No person found'
  end

  def load_books
    file = open('data/books.json')
    books = JSON.parse(file.read)
    book_list = []

    unless books['books'].empty?
      books['books'].each do |book|
        book_list << Book.new(book['title'], book['author'])
      end
    end
    book_list
  rescue StandardError
    puts 'No books found'
  end

  def get_person(_id)
    @people.select { |person| person.id == @person_id }[0]
  end

  def get_book(_id)
    @books.select { |book| book.id == @book_id }[0]
  end

  def load_rentals
    file = open('data/rentals.json')
    rentals = JSON.parse(file.read)
    rental_list = []


    unless rentals['rentals'].empty?
      rentals['rentals'].each do |rental|
        rental_list << Rental.new(rental['person'], rental['book'], rental['date'])
      end
    end
    rental_list
  rescue StandardError
    puts 'No rentals found'
  end
end
