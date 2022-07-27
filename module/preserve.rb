require 'json'

module PreserveData


  def load_persons

    begin
      file = open('./data/people.json')
      persons=JSON.parse(file.read)
      person_list=[]

      if !persons['people'].empty?
        persons['people'].each do |person|
          new_teacher= Teacher.new(person['class'],person['id'], person['name'], person['age'], person['specialization'])
          new_student= Student.new(person['class'], person['id'], person['name'], person['age'], person['parent_permission'])
          if new_teacher
            person_list.push(new_teacher)
          else new_student
            person_list.push(new_student)
          end
        end
        end
      person_list
      rescue
        puts 'No person found'
    end
  end


  def load_books
    begin
      file = open("data/books.json")
      books = JSON.parse(file.read)
      book_list=[]


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