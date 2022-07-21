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
            list_all_rentals_by_person_id
        when "7"
            puts "Thanks for using our Library!"
        end
    end

    def list_all_books
        puts 'No books in the library! Please add a student or teacher.' if @books.empty?
        @books.each { |book|
            puts "Title: #{book.title} Author: #{book.author}"}
            options
    end

    def create_a_person
        puts "Do you want to create a student(1) or a teacher(2)?[input number]:"
        user_option=gets.chomp
        if user_option == "1"
            puts "Please enter the age of the student:"
            age=gets.chomp.to_i
            puts "Please enter the name of the student:"
            name=gets.chomp
            puts "Do you have parent permission[Y/N]:"
            parent_permission=gets.chomp.downcase
            student=Student.new(age,name,parent_permission:parent_permission)
            @people.push(student)
            puts "Student created successfully!"
            options

        elsif user_option == "2"
            puts "Please enter the age of the teacher:"
            age=gets.chomp.to_i
            puts "Please enter the name of the teacher:"
            name=gets.chomp
            puts "Please enter the specialization of the teacher:"
            specialization=gets.chomp
            teacher=Teacher.new(age,specialization,name)
            @people.push(teacher)
            puts "Teacher created successfully!"
            options
        end
    end
end
