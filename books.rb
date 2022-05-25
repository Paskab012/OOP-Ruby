require './book'
require './initialize'
require 'json'

class Books 
    attr_accessor :books

    def initialize
        @books = read_books
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
        write_books(@books)
    
        puts 'New book item was successfully created'
    end
end