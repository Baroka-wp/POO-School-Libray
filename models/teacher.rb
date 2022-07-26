require './models/person'

class Teacher < Person
  attr_reader :specialization

  def initialize(id, age, specialization, name = 'Unknown', parent_permission: true)
    super(age, name, parent_permission: parent_permission)
    @id = id || Random.rand(1...1000)
    @specialization = specialization
  end

  def can_use_services?
    true
  end
end
