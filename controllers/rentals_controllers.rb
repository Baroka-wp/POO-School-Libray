require 'json'
require './models/rental'

module RentalsControllers
    def load_rentals
        store = []
        file = open('./storage/rentals.json')
        if File.exist?(file) && File.read(file) != ''
            file_data = file.read
            JSON.parse(file_data).each do |rental|
                store << Rental.new(rental['date'],
                                     person(rental['person_id']),
                                     book(rental['book_id']))
            end 
        else
            File.write(file, '[]') 
        end       
        store
    end

    def save_rentals
        store = []
        @rentals.each do |rental|
            store << {date: rental.date, book_id: rental.book.id, person_id: rental.person.id}
        end
        File.write('./storage/rentals.json', store.to_json)
    end

    private

    def book(id)
        @books.each {|b| return b if b.id == id}
    end 
    def person(id)
        @persons.each {|pers| return pers if pers.id == id}
    end 
end