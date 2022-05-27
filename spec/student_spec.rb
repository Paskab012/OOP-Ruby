require 'spec_helper'

describe Student do
    before :each do
        @student = Student.new( name ='John',age=15)
    end

    describe '#new' do
        it 'takes two parameters and returns a student object' do
            expect(@student.instance_of?(Student)) == true
        end
    end


    describe '#name' do
        it 'returns the correct name' do
           expect(@student.name).to eql 'John'
        end
    end

    
    describe '#age' do
        it 'returns the correct age' do
            expect(@student.age).to eql 15
        end
    end

    describe '#play hooky ?' do
        it 'if it plays hooky ¯\(ツ)/¯' do
          expect(@student.play_hooky).to eql("¯\(ツ)/¯")
        end
      end
    end
