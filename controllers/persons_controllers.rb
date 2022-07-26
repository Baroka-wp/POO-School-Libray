require 'json'
require './models/student'
require './models/teacher'

module PersonsControllers
    def load_persons
        store = []
        file = open('./storage/persons.json')
        if File.exist?(file) && File.read(file) != ''
            file_data = file.read
            JSON.parse(file_data).each do |person|
               if person['className'] == 'Student'
                    store << Student.new(id=person['id'], classroom=nil, age=person['age'], name=person['name'],
                        parent_permission: person['parent_permission'])
                else
                    store << Teacher.new(id=person['id'], age=person['age'], specilization=person['specialization'],
                                    name=person['name'])
                end

            end
        else
            File.write(file, '[]')
        end
        store
    end

    def save_persons
        store = []
        @persons.each do |person|
            store << {id: person.id, name: person.name, age: person.age,
                    parent_permission: person.parent_permission,
                    className: person.class} if person.is_a?(Student)
            store << {id: person.id, name: person.name, age: person.age,
                    parent_permission: person.parent_permission,
                    specialization: person.specialization,
                    className: person.class} if person.is_a?(Teacher)

        end
        File.write('./storage/persons.json', store.to_json)
    end

end