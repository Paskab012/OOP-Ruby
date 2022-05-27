require './spec_helper'

describe Person do
  before :each do
    @person = Person.new 25, 'Name'
  end

  describe '#new' do
    it 'should return a person obj. while taking two parameters' do
      @person.should be_an_instance_of Person
    end
  end

  describe '#age' do
    it 'should return a correct age' do
      @person.age.should eql 25
    end
  end

  describe '#name' do
    it 'should return the correct name' do
      @person.name.should eql 'Name'
    end
  end

  describe '#can_use_services? method test' do
    it 'Should return true if age >= 18 or parent_permission: true ' do
      person1 = Person.new(10, 'Name', parent_permission: true)
      expect(person1.can_use_services?).to be true
      person2 = Person.new(20, 'Name', parent_permission: false)
      expect(person2.can_use_services?).to be true
    end
  end

  describe '#correct_name' do
    it 'Should return the name when correct_name is called' do
      expect(@person.correct_name).to eql 'Name'
    end
  end

  context 'when add rental method is called' do
    it 'should add the rental request to the array' do
      expect(@person.rentals.length).to eql(0)
      @book = Book.new('Ruby on Rails ', 'marc zukerberg')
      @person.add_rental('2001-05-03', @book)
      expect(@person.rentals.length).to eql(1)
    end
  end
end