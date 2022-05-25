require './book'
require './classroom'
require './per_son'
require './rental'
require './student'
require './teacher'

class App
  def initialize
    @books = []
    @people = []
    @rentals = []
  end

  def all_booklist
    puts 'There is no book found in the store' if
    @books.empty?
    @books.each { |book| puts "Title: #{book.title}, Author: #{book.author}" }
  end

  def create_book
    print 'book title: '
    title = gets.chomp

    print 'book author: '
    author = gets.chomp

    book = Book.new(title, author)
    @books.push(book)

    puts 'New book item was successfully created'
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
