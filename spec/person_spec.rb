require './models/person'

describe Person do
    before :each do
        @person = Person.new 23, 'John'
    end

    it 'should display person name' do
        expect(@person.name).to eq 'John'
    end

    it 'should display person age' do
        expect(@person.age).to eq 23
    end
end