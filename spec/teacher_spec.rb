require './models/teacher'
require './models/book'

describe Teacher do
  before :each do
    @teacher1 = Teacher.new nil, nil, 23, 'John'
    @teacher2 = Teacher.new nil, nil, 23, 'Doe'
    @book = Book.new nil, 'way', 'Yang'
  end

  it 'should display teacher name' do
    expect(@teacher1.name).to eq 'John'
    expect(@teacher2.name).to eq 'Doe'
  end

  it 'should display teacher parent permission' do
    expect(@teacher1.parent_permission).not_to eq false
    expect(@teacher2.parent_permission).to eq true
  end

  it 'should display book rented by Teacher' do
    @teacher1.add_rental '2022/07/27', @book
    @teacher1.rentals.each do |rental|
      expect(rental.book.title).to eq 'way'
    end
  end
end
