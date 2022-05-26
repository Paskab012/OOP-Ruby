require './people'
require './rental'
require './books'
require './initialize'
require 'json'

class BookRentals
  attr_accessor :rentals, :people, :books

  def initialize(books, person)
    # @rentals = []
    @books = books
    @people = person
    @rentals = JSON.parse(File.read('./data/rentals.json'))
  end

  def listofrentals
    puts 'Wait... No rental found now!' if JSON.parse(File.read('./data/rentals.json')).empty?
    print 'Input your ID to view rentals: '
    id = gets.chomp.to_i
    rental = JSON.parse(File.read('./data/rentals.json')).select { |rend| rend['id'] == id }

    if rental.empty?
      puts 'Incorrect ID, no rental was made! try another ID'
    else
      puts 'Those are your rental credentials : '
      puts ''
      rental.each_with_index do |record, index|
        puts ''
        print "#{index + 1}| Date: #{record['date']} | Borrower: #{record['borrower']}"
        print " Requested with: \"#{record['book']}\" by #{record['author']}"
        puts ''
      end
    end
  end

  def create_rental
    if @books.empty? && @people.empty?
      puts 'No books and people found in the system'
    else
      puts 'Input a number corresponding to the book: '
      @books.each_with_index do |book, index|
        puts "#{index + 1}) Book Title: \"#{book.title}\" | Author: #{book.author}"
      end
      number = gets.chomp.to_i
      index = number - 1

      puts 'PLease type your ID: '
      @people.each { |person| puts "[#{person.class}] Name: #{person.name} | Age: #{person.age} | ID: #{person.id}" }
      identity = gets.chomp.to_i

      individual = @people.select { |person| person.id == identity }.first

      print 'Enter date[yyyy-mm-dd]: '
      date = gets.chomp.to_s

      rent = Rental.new(date, @books[index], individual)
      temp = {
        date: rent.date,
        id: individual.id,
        borrower: individual.name,
        book: @books[index].title,
        author: @books[index].author
      }

      @rentals << temp
      File.write('./data/rentals.json', JSON.generate(@rentals))
      puts 'The book was rent successfully'
    end
  end
end
