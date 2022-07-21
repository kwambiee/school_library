class App

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
end
