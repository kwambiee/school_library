require 'json'

module PreserveData


  def load_persons
    begin
      file = open('./data/people.json')
      persons=JSON.parse(file.read)
      p persons
      if persons
        @people = persons.map do |person|
          if person['class'] == 'Student'
            Student.new(person['age'], person['name'], parent_permission: person['parent_permission'])
          else
            Teacher.new(person['age'], person['name'])
          end
        end
      end
    rescue
      puts 'No persons found!'
    end
  end


  def load_books
    begin
      file = open("data/books.json")
      books = JSON.parse(file.read)
      book_list=[]
      # p books['books']

      if !books['books'].empty?
        books['books'].each do |book|
          book_list << Book.new(book['title'], book['author'])
        end
      end
      book_list
    rescue
      puts "No books found"
    end
  end

  def get_person(id)
    @people.select { |person| person.id == @person_id }[0]
  end

  def get_book(id)
    @books.select { |book| book.id == @book_id }[0]
  end

  def load_rentals
    begin
      file = open("data/rentals.json")
      rentals = JSON.parse(file.read)
      if rentals
        rentals.each do |rental|
          @rentals << Rental.new(rental['date'], get_person(rental['person_id']), get_book(rental['book_id']))
        end
      else
        []
      end
    rescue
      puts "No rentals found"
    end
  end

end