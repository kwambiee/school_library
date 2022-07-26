require 'json'

module PreserveData

  def load_persons
    if File.exist?('./data/people.json')
      JSON.parse.(File.read('./data/people.json')).each do |person|
        if person['class'] == 'Student'
          (Student.new(person['age'], person['name'], parent_permission: person['parent_permission']))
        else
          (Teacher.new(person['age'], person['name']))
        end
      end
    else
      puts 'No data found!'
    end
  end

  def load_books
    if File.exist?('./data/books.json')
      JSON.parse.(File.read('./data/books.json')).each do |book|
        (Book.new(book['title'], book['author']))
      end
    else
      puts 'No data found!'
    end
  end

  def get_person(id)
    @people.select { |person| person.id == @person_id }[0]
  end

  def get_book(id)
    @books.select { |book| book.id == @book_id }[0]
  end

  def load_rentals
    if File.exist?('./data/rentals.json')
      JSON.parse.(File.read('./data/rentals.json')).each do |rental|
        (Rental.new(rental['date'], get_person(rental['person_id']), get_book(rental['book_id'])))
      end
    else
      puts 'No data found!'
    end
  end

end