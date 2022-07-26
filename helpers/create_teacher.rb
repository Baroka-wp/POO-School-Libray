class CreateTeacher
  def initialize(persons)
    @persons = persons
  end

  def create_teacher
    age = -1
    print 'Age: '
    while age <= 0
      age = gets.chomp.to_i
      print 'Add correcte age of teacher: ' if age <= 0
    end
    print 'Name: '
    name = gets.chomp.strip.capitalize
    print 'Specialization: '
    specialization = gets.chomp.strip.capitalize
    @persons << Teacher.new(nil, age, specialization, name)
    puts 'Teacher created successfuly! ✅ 🎉🎉🎉 '
    puts
  end
end
