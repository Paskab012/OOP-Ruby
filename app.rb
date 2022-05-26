require './books'
require './classroom'
require './per_son'
require './rental'
require './student'
require './teacher'
require './people'
require './book_rentals'

class App
  def initialize
    @books = Books.new
    @people = Mypeople.new
    @rentals = BookRentals.new(@books.books, @people.people)
  end

  def start
    home
  end

  def landing
    puts ''
    puts "Please select a number:
                1. List all books
                2. List all people
                3. Create person account
                4. Create a book
                5. Create a rental
                6. List all rentals for a given person ID
                7. Exit"
    gets.chomp
  end

  # rubocop:disable Style/CyclomaticComplexity
  def home
    case landing
    when '1'
      @books.all_booklist
    when '2'
      @people.all_peoplelist
    when '3'
      @people.create_person
    when '4'
      @books.create_book
    when '5'
      @rentals.create_rental
    when '6'

      @rentals.rentalslist

    when '7'

      puts 'Session closed! Ciao ciao!'

      exit

    else

      puts 'Oups! something went wrong! Input your correct credentials please...'

    end
    home
  end
end
# rubocop:enable Style/CyclomaticComplexity
