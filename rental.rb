class Rental
  def initialize(data, book, person)
    @data = data
    @person = person
    @book = book
    person.rental << self
    book.rental << self
  end

  attr_accessor :date, :book, :person
end
