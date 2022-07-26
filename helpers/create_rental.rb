class CreateRental
  def initialize(people, books, rentals)
    @books = books
    @people = people
    @rentals = rentals
  end

  def create_rental
    @books.each_with_index do |book, index|
      puts "#{index}- Title: #{book.title} Author: #{book.author}"
    end
    print 'Select the key of the book: '
    book_select = gets.chomp.chomp.to_i
    @people.each_with_index do |person, index|
      puts "#{index}- [#{person.class.name}] ID: #{person.id} Name: #{person.name} "
    end
    print 'Select the key of the person: '
    person_select = gets.chomp.chomp.to_i
    print 'Select the date: (Year/Month/Day): '
    date = gets.chomp.strip
    book = @books[book_select]
    person = @people[person_select]
    @rentals << person.add_rental(date, book)
    puts 'Rental created successfuly! ✅ 🎉🎉🎉'
    puts
  end
end
