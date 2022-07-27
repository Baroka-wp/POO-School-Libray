require './models/student'
require './models/book'

describe Student do
  before :each do
    @student1 = Student.new nil, nil, 23, 'John', parent_permission: false
    @student2 = Student.new nil, nil, 23, 'Doe', parent_permission: true
    @book = Book.new nil, 'way', 'Yang'
  end

  it 'should display student name' do
    expect(@student1.name).to eq 'John'
    expect(@student2.name).to eq 'Doe'
  end

  it 'should display student parent permission' do
    expect(@student1.parent_permission).to eq false
    expect(@student2.parent_permission).to eq true
  end

  it 'should display book rented by student' do
    @student1.add_rental '2022/07/27', @book
    @student1.rentals.each do |rental|
      expect(rental.book.title).to eq 'way'
    end
  end
end
