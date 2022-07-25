class CreateStudent
  def initialize(persons)
    @persons = persons
  end

  def create_student
    print 'Age: '
    age = -1
    while age <= 0
      age = gets.chomp.to_i
      print 'Add correcte age of student: ' if age <= 0
    end
    print 'Name: '
    name = gets.chomp.strip.capitalize
    print 'Has parent permission ? (N/Y): '
    permission = gets.chomp.strip.upcase
    case permission
    when 'Y', 'YES'
      permission = true
    when 'N', 'NO'
      permission = false
    end
    @persons << Student.new(nil, age, name, parent_permission: permission)
    puts 'Student created successfuly! ✅ 🎉🎉🎉 '
    puts
  end
end
