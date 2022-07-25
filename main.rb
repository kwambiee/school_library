require './app'

class Main
  def initialize
    @app = App.new
  end

  def welcome
    puts 'Welcome to School Library App!'
    puts ''
    puts 'Please choose an option by entering a number'
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
    user_option = gets.chomp
    @app.get_option(user_option)
    @app.other_options(user_option)
  end
end

main = Main.new
main.welcome
