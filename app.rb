class App
    def initialize
        @books=[]
        @people=[]
        @rentals=[]
        @classroom_one=Classroom.new("A")
    end

    def welcome
        puts "Welcome to School Library App!"
        puts ""
        puts "Please choose an option by entering a number"
        options
    end

    def options
        puts "
        1 - List all books.
        2 - List all people.
        3 - Create a person.
        4 - Create a book.
        5 - Create a rental.
        6 - List all rentals for a given person id.
        7 - Exit
        "
        user_option=gets.chomp
        get_option(user_option)
    end

    def get_option(user_option)
        case user_option
        when "1"
            list_all_books
        when "2"
            list_all_people
        when "3"
            create_a_person
        when "4"
            create_a_book
        when "5"
            create_a_rental
        when "6"
            list_all_rentals
        when "7"
            puts "Thanks for using our Library!"
        end
    end

    def list_all_books
        puts 'The are no books registered! Please add a student or teacher.' if @books.empty?
        @books.each { |book|
            puts "Title: #{book.title} Author: #{book.author}"}
            options
    end

    def list_all_people
        puts 'The are no people registered! Please add a student or teacher.' if @people.empty?
        @people.map { |person|
            puts "[#{person.class}] Id:#{person.id} Name:#{person.name} Age: #{person.age}"}
            options
    end

    def create_a_person
        puts "Do you want to create a student(1) or a teacher(2)?[input number]:"
        user_option=gets.chomp
        if user_option == "1"
            puts "Age:"
            age=gets.chomp.to_i
            puts "Name:"
            names=gets.chomp
            puts "Do you have parent permission[Y/N]:"
            parent_permission=gets.chomp.downcase
            student=Student.new(age,names,parent_permission)
            @people.push(student)
            puts "Student created successfully!"
            options

        elsif user_option == "2"
            puts "Age:"
            age=gets.chomp.to_i
            puts "Name:"
            name=gets.chomp
            puts "Specialization:"
            specialization=gets.chomp
            teacher=Teacher.new(age,specialization,name)
            @people.push(teacher)
            puts "Teacher created successfully!"
            options
        end
    end
    def create_a_book
        puts "Please enter the title of the book:"
        title=gets.chomp
        puts "Please enter the author of the book:"
        author=gets.chomp
        book=Book.new(title,author)
        @books.push(book)
        puts "Book created successfully!"
        options
    end

    def create_a_rental
        puts "Select a book from the list by index(not id):"
        @books.each_with_index { |book, index| puts "#{index} Title: #{book.title}, Author: #{book.author}" }
        book_index=gets.chomp.to_i

        puts "select a person from the list by index(not id):"
        @people.each_with_index { |person, index| puts "#{index} [#{person.class}] Id:#{person.id} Name:#{person.name} Age: #{person.age}" }
        person_index=gets.chomp.to_i

        puts "Date:"
        date=gets.chomp
        rental=Rental.new(date,@people[person_index],@books[book_index])
        @rentals.push(rental)
        puts "Rental created successfully!"
        options
    end

    def list_all_rentals
        puts "ID of person:"
        person_id=gets.chomp.to_i

        puts "Rentals:"
        @rentals.each do |rental|
            if rental.person.id == person_id
                puts "Date: #{rental.date} Book: '#{rental.book.title}' by #{rental.book.author}"
            end
        end
        options

end