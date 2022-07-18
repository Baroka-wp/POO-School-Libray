require './person'

class Teacher < Person
  def initialize(specialization, name = 'Unknown')
    super(true)
    @name = name
    @specialization = specialization
  end

  def can_use_services?
    true
  end
end
