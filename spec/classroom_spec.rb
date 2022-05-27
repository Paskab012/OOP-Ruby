require 'spec_helper'

describe Classroom do
  before :each do
    @classroom = Classroom.new 'Label'
  end

  describe '#new' do
    it 'should takes one parameters and returns a classroom object' do
      expect(@classroom.instance_of?(Classroom)) == true
    end
  end

  describe '#label' do
    it 'should returns the correct label' do
      expect(@classroom.label).to eql 'Label'
    end
  end
end
