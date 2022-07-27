require './models/rental'
require './models/student'
require './models/teacher'
require './models/book'

describe Rental do
  before :each do
    @person = Student.new nil, nil, 22, 'Patrick', parent_permission: true
    @book = Book.new nil, 'way', 'Yang'
    @rental = Rental.new '2021/03/12', @person, @book
  end

  it 'should display rented book title' do
    @person.rentals.each do |rental|
      expect(rental.book.title).to eq 'way'
    end
  end
  it 'should display rented person name' do
    @person.rentals.each do |rental|
      expect(rental.person.name).to eq 'Patrick'
    end
  end
  it 'should display rented date' do
    @person.rentals.each do |rental|
      expect(rental.date).to eq '2021/03/12'
    end
  end
end
