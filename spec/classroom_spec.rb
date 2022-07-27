require './models/classroom'
require './models/student'

describe Classroom do 
    before :each do
        @math_classroom = Classroom.new 'Math Classroom'
        @english_classroom = Classroom.new 'English Classroom'
        @student1 = Student.new nil, nil, 23, 'John', parent_permission: false
        @student2 = Student.new nil, nil, 23, 'Doe', parent_permission: true

        @math_classroom.add_student(@student1)
        @math_classroom.add_student(@student2)
        @english_classroom.add_student(@student1)
    end

    it 'should display classroom label' do
        expect(@math_classroom.label).to eq 'Math Classroom'
        expect(@english_classroom.label).to eq 'English Classroom'
    end

    it 'should add students in the classroom' do
        expect(@math_classroom.students.length).to eq 2
        expect(@english_classroom.students.length).to eq 1
    end
end