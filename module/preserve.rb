require 'json'

module PreserveData


  def load_persons

    begin
      file = open('./data/people.json')
      persons=JSON.parse(file.read)
      person_list=[]

      if !persons['people'].empty?
        persons['people'].each do |person|
          if person['class']=='Teacher'
            person_list << Teacher.new( person['name'], person['age'], person['specialization'])

          elsif  person['class']=='Student'
          person_list << Student.new( person['age'],person['name'], parent_permission:person['parent_permission'])
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
      rental_list=[]

      if !rentals['rentals'].empty?
        rentals['rentals'].each do |rental|
          rental_list  << Rental.new(rental['date'], get_person(rental['person_id']), get_book(rental['book_id']))
        end
      end
      rental_list
    rescue
      puts "No rentals found"
    end
  end

end