require './nameable'
require './rental'

class Person < Nameable
  def initialize(age, name = 'Unknown', parent_permission: true)
    super()
    @id = Random.rand(1..1000)
    @name = name
    @age = age
    @parent_permission = parent_permission
    @rentals = []
  end

  attr_reader :id
  attr_accessor :name, :age, :rentals

  def can_use_services?
    of_age? || @parent_permission
  end

  def correct_name
    @name
  end

  def add_rental(book, date)
    @rentals.push(Rental.new(date, book, self)) unless 
    @rentals.include?(Rental.new(date, book, self))
  end

  private

  def of_age?
    age >= 18
  end
end
