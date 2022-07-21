require './teacher'
require './student'
require './person'
require './book'
require './capitalize_decorator'
require './trimmer_decorator'
require './rental'

# person = Person.new(22, 'maxime')
# p person.correct_name
# capitalizedPerson = CapitalizeDecorator.new(person)
# p capitalizedPerson.correct_name
# capitalizedTrimmedPerson = TrimmerDecorator.new(capitalizedPerson)
# p capitalizedTrimmedPerson.correct_name

b = Book.new('way', 'Yun')
student = Student.new(nil,12, 'Rio')
student.add_rental('2021', b)
student.add_rental('2022', b)
p student.rentals