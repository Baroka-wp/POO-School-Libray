require './person'

class Student < Person
  def initialize(classroom, name = 'Unknown')
    super(false)
    @name = name
    @classroom = classroom
  end

  def play_hooky
    "¯\(ツ)/¯"
  end
end
