require './spec_helper'
require '../student'
require '../capitalize_decorator'
require '../trimmer_decorator'
require '../decorators'

describe Nameable do
  before :each do
    person = Student.new(15, 'john')
    @name = Decorator.new(person)
    @capitalize = CapitalizeDecorator.new(@name)
    @trimmed = TrimmerDecorator.new(@name)
  end

  it 'should return a name' do
    expect(@name.correct_name).to eql('john')
  end

  it 'should capitalize the name' do
    expect(@capitalize.correct_name).to eql('John')
  end

  it 'should trim the name' do
    expect(@trimmed.correct_name).to eql('john')
  end
end