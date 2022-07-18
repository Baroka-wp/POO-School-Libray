# rubocop:disable Naming/PredicateName, Lint/Syntax
class Person
  attr_reader :id
  attr_accessor :name, :age, :parent_permission

  def initialize(age, parent_permission: true, name = 'Unknown')
    @id = Random.rand(1...1000)
    @name = name
    @age = age
    @parent_permission = parent_permission
  end

  def can_use_services?
    return false unless @parent_permission || is_of_age?

    true
  end

  private

  
  def is_of_age?
    return false if @age < 18

    true
  end
end
# rubocop:enable Naming/PredicateName, Lint/Syntax
