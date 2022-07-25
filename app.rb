#!/usr/bin/env ruby
# rubocop:disable Metrics/CyclomaticComplexity, Metrics/ClassLength
class App
  def initialize
    @people = []
    @books = []
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

  def run
    puts
    puts ' Welcome to School Library App ! '
    puts '--------***--------------'
    option = nil
    while option != 7
      puts 'Please choose an option by entrerin a number: '
      options
      print '[Input number]: '
      option = gets.chomp.strip.to_i
      make(option)
      puts
    end
    puts '--------***--------------'
    puts ' GOOD BYE 🎉🎉🎉'
    puts '--------***--------------'
  end

  def make(option)
    case option
    when 1
      all_books
    when 2
      all_people
    when 3
      create_person
    when 4
      create_book
    when 5
      create_rental
    when 6
      list_of_rental
    when 7
      nil
    else
      puts 'Wrong option'
      options
    end
  end

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

  def all_people
    key = 0
    puts
    puts 'People 👥'
    puts 'No people yet! Choose (3) to add a person ' if @people.empty?
    @people.each do |person|
      print "#{key}- [#{person.class.name}] ID: #{person.id} Name: #{person.name} "
      print "Parent Permission: #{person.parent_permission}" if person.is_a?(Student)
      print "Specialisation: #{person.specialization}" if person.is_a?(Teacher)
      puts
      key += 1
    end
  end

  def create_person
    entry = nil
    print 'Choose (1) to Create a Student or (2) for a Teacher: '
    until [1, 2].include?(entry)
      entry = gets.chomp.strip.to_i
      puts 'Choise is not correct : (1) for Student, (2) for Teacher' unless [1, 2].include?(entry)
    end
    case entry
    when 1
      create_student
    when 2
      create_teacher
    end
  end

  def create_teacher
    age = -1
    print 'Age: '
    while age <= 0
      age = gets.chomp.to_i
      print 'Add correcte age of teacher: ' if age <= 0
    end
    print 'Name: '
    name = gets.chomp.strip.capitalize
    print 'Specialization: '
    specialization = gets.chomp.strip.capitalize
    @people << Teacher.new(age, specialization, name)
    puts 'Teacher created successfuly! ✅ 🎉🎉🎉 '
    puts
  end

  def create_student
    print 'Age: '
    age = -1
    while age <= 0
      age = gets.chomp.to_i
      print 'Add correcte age of student: ' if age <= 0
    end
    print 'Name: '
    name = gets.chomp.strip.capitalize
    print 'Has parent permission ? (N/Y): '
    permission = gets.chomp.strip.upcase
    case permission
    when 'Y', 'YES'
      permission = true
    when 'N', 'NO'
      permission = false
    end
    @people << Student.new(nil, age, name, parent_permission: permission)
    puts 'Student created successfuly! ✅ 🎉🎉🎉 '
    puts
  end

  def create_book
    print 'Title: '
    title = gets.chomp.strip.capitalize
    print 'Author: '
    author = gets.chomp.strip.capitalize
    @books << Book.new(title, author)
    puts 'Book created successfully! ✅ 🎉🎉🎉'
    puts
  end

  def create_rental
    all_books
    print 'Select the key of the book: '
    book_select = gets.chomp.chomp.to_i
    all_people
    print 'Select the key of the person: '
    person_select = gets.chomp.chomp.to_i
    print 'Select the date: (Year/Month/Day): '
    date = gets.chomp.strip
    book = @books[book_select]
    person = @people[person_select]
    person.add_rental(date, book)
    puts 'Rental created successfuly! ✅ 🎉🎉🎉'
    puts
  end

  def list_of_rental
    puts
    all_people
    puts 'Choose Person ID?: '
    entry = gets.chomp.to_i
    puts 'Rentals 🤝🏾'
    @people.each do |person|
      next unless person.id == entry

      person.rentals.each do |rental|
        puts "Date: #{rental.date} Book title: #{rental.book.title} by #{rental.book.author}"
        puts '---====---'
      end
    end
  end
end
# rubocop:enable Metrics/CyclomaticComplexity, Metrics/ClassLength
