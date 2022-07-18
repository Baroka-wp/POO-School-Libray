require './teacher'
require './student'

person = Person.new(17, 'Patson')
student = Student.new('Carlos', 4)
teacher = Teacher.new('Pablo', 'Math')
teacher.age = 10
student.age = 17
student.parent_permission = false
p student.play_hooky
p person.can_use_services?
p student.can_use_services?
