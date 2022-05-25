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









  

  def create_rental
    if @books.size.zero?
      puts 'Books not found'
    elsif @people.size.zero?
      puts 'Person Not found'
    else
      puts 'select book item by number'
      @books.each_with_index { |book, index| puts "#{index}) Title: #{book.title}, Author: #{book.author}" }
      selected_book = gets.chomp.to_i

      puts 'select a person by number'
      @people.each_with_index do |person, index|
        puts "#{index}) Name: #{person.name} Age: #{person.age} Id: #{person.id}"
      end
      selected_person = gets.chomp.to_i

      puts 'Enter date [YYYY-MM-DD]'
      date = gets.chomp.to_s

      rental_item = Rental.new(date, @books[selected_book], @people[selected_person])
      @rentals.push(rental_item)
      puts 'Rental was created successfully'
    end
  end

  def rentalslist
    puts 'inter person id'
    id = gets.chomp.to_i
    @rentals.each do |rental|
      if rental.person.id.to_i == id.to_i
        puts "Date: #{rental.date}, Book: '#{rental.book.title}' by #{rental.book.author}"
      end
    end
  end
end
