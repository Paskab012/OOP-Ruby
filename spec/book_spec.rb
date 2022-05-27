require './book'
require './student'

describe Book do
  before :each do
    @book = Book.new 'Title', 'Author'
  end

  describe '#new' do
    it 'should return a book obj. while taking two parameters' do
      @book.should be_an_instance_of Book
    end
  end

  describe '#title' do
    it 'should return the right title' do
      @book.title.should eql 'Title'
    end
  end

  describe '#author' do
    it 'should return the required author' do
      @book.author.should eql 'Author'
    end
  end

  it 'should put rental to be empty' do
    expect(@book.rentals).to eql []
  end

  it 'should add a rental' do
    @student = Student.new('16', 'pako')
    expect(@book.rentals.length).to eql(0)
    @book.add_rental('2020-04-01', @student)
    expect(@book.rentals.length).to eql(1)
  end
end
