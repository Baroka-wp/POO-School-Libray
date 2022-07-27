require './models/book'

describe Book do
  before :each do
    @book = Book.new nil, 'way', 'yang'
  end
  it 'should print the book title' do
    expect(@book.title).to eq 'way'
  end
  it 'should print the book author' do
    expect(@book.author).to eq 'yang'
  end
end
