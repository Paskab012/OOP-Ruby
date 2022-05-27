require 'spec_helper'

describe Classroom do
  before :each do
    @classroom = Classroom.new 'Label'
  end

  describe '#new' do
    it 'takes one parameters and returns a classroom object' do
        expect(@classroom.instance_of?(Classroom)) == true 
    end
  end

  describe '#label' do
    it 'returns the correct lable' do
        expect(@classroom.label).to eql 'Label'
    end
  end
end