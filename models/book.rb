require './models/rental'
class Book
  attr_reader :rentals, :id
  attr_accessor :title, :author

  def initialize(id, title, author)
    @id = id || Random.rand(1...1000)
    @title = title
    @author = author
    @rentals = []
  end

  def add_rental(date, person)
    Rental.new(date, self, person)
  end
end
