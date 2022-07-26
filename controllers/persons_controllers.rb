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
        store << if person['className'] == 'Student'
                   Student.new(person['id'], nil, person['age'], person['name'],
                               parent_permission: person['parent_permission'])
                 else
                   Teacher.new(person['id'], person['age'], person['specialization'],
                               person['name'])
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
      if person.is_a?(Student)
        store << { id: person.id, name: person.name, age: person.age,
                   parent_permission: person.parent_permission,
                   className: person.class }
      end
      next unless person.is_a?(Teacher)

      store << { id: person.id, name: person.name, age: person.age,
                 parent_permission: person.parent_permission,
                 specialization: person.specialization,
                 className: person.class }
    end
    File.write('./storage/persons.json', store.to_json)
  end
end
