require './create_teacher'
require './create_student'

class CreatePerson
  def initialize(persons)
    @persons = persons
    @create_teacher = CreateTeacher.new(@persons)
    @create_student = CreateStudent.new(@persons)
  end

  def create_person
    entry = nil
    print 'Choose (1) to Create a Student or (2) for a Teacher: '
    until [1, 2].include?(entry)
      entry = gets.chomp.strip.to_i
      puts 'Choise is not correct : (1) for Student, (2) for Teacher' unless [1, 2].include?(entry)
    end
    case entry
    when 1
      @create_student.create_student
    when 2
      @create_teacher.create_teacher
    end
  end
end
