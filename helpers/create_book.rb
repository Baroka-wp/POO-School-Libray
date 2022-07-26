require './models/book'
require './controllers/books_controllers'
class CreateBook
  def initialize(books)
    @books = books
  end

  def create_book
    print 'Title: '
    title = gets.chomp.strip.capitalize
    print 'Author: '
    author = gets.chomp.strip.capitalize
    @books << Book.new(id=nil, title=title, author=author)
    
    puts 'Book created successfully! ✅ 🎉🎉🎉'
    puts
  end
end
