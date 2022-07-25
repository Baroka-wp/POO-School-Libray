require './create_book'
require './create_person'
require './create_rental'
require './create_student'
require './create_teacher'
require './teacher'
require './student'
require './rental'

class Options
  def initialize
    @books = []
    @persons = []
    @create_book = CreateBook.new(@books)
    @create_person = CreatePerson.new(@persons)
    @create_rental = CreateRental.new(@persons, @books)
    # binding.pry
  end

  def options
    puts '1 => List all book'
    puts '2 => List all People'
    puts '3 => Create a person'
    puts '4 => Create a book'
    puts '5 => Create a rental'
    puts '6 => List all rentals for a given person id'
    puts '7 => Exit'
  end

  # rubocop:disable Metrics/CyclomaticComplexity

  def make(option)
    case option
    when 1
      all_books
    when 2
      all_people
    when 3
      @create_person.create_person
    when 4
      @create_book.create_book
    when 5
      @create_rental.create_rental
    when 6
      list_of_rental
    when 7
      nil
    else
      puts 'Wrong option'
      option
    end
  end

  # rubocop:enable Metrics/CyclomaticComplexity

  def all_books
    key = 0
    puts
    puts 'Books 📚'
    puts 'No book yet! Choose (4) to add a book ' if @books.empty?
    @books.each do |book|
      puts "#{key}- Title: #{book.title} Author: #{book.author}"
      key += 1
    end
  end

  def list_of_rental
    puts
    all_people
    puts 'Choose Person ID?: '
    entry = gets.chomp.to_i
    puts 'Rentals 🤝🏾'
    @persons.each do |person|
      next unless person.id == entry

      person.rentals.each do |rental|
        puts "Date: #{rental.date} Book title: #{rental.book.title} by #{rental.book.author}"
        puts '---====---'
      end
    end
  end

  def all_people
    key = 0
    puts
    puts 'People 👥'
    puts 'No people yet! Choose (3) to add a person ' if @persons.empty?
    @persons.each do |person|
      print "#{key}- [#{person.class.name}] ID: #{person.id} Name: #{person.name} "
      print "Parent Permission: #{person.parent_permission}" if person.is_a?(Student)
      print "Specialisation: #{person.specialization}" if person.is_a?(Teacher)
      puts
      key += 1
    end
  end
end
