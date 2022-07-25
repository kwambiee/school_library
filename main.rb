require './app'

def main
  app = App.new

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
    get_option(user_option)
    other_options(user_option)
  end
  app.run
end
main
