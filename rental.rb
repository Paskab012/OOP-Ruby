require_relative './book'
require_relative './per_son'


class Rental
  def initialize(date, book, person)
    @date = date
    @person = person
    person.rentals.push(self)
    @book = book
    book.rentals.push(self)
  end

  attr_accessor :date, :book, :person
end
