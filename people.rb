equire './per_son'
require './data'
require 'json'

class Mypeople
  attr_accessor :people

  def initialize
    @people = read_people
  end

  def all_peoplelist
    puts 'No people found!' if @people.empty?
    @people.each { |person| puts "[#{person.class}], Age: #{person.name}, Name: #{person.age}, Id: #{person.id}" }
  end

  def create_person
    print 'Missing student or teacher? create student (1) or a teacher (2)
        [Input the number]: '
    option = gets.chomp
    case option
    when '1'
      create_student
    when '2'
      create_teacher
    else
      puts 'invalid input'
    end
    write_people(@people)
    puts 'Person created successfully'
  end

  def create_teacher
    print 'teacher age: '
    age = gets.chomp

    print 'teacher specialization: '
    specialization = gets.chomp

    print 'teacher name: '
    name = gets.chomp

    teacher = Teacher.new(age, specialization, name, parent_permission: true)
    puts 'New teacher was created succefully'
    @people.push(teacher)
  end

  def create_student
    print 'student age: '
    age = gets.chomp

    print 'student name: '
    name = gets.chomp

    print 'Parent permission [Yes or No]: '
    parent_permission = gets.chomp.downcase

    case parent_permission
    when 'no'
      student = Student.new(age, name, parent_permission: false)
      @people.push(student)
    when 'yes'
      student = Student.new(age, name, parent_permission: true)
      @people.push(student)
    end
    write_people(@people)
    puts 'New student was created successfully'
  end
end