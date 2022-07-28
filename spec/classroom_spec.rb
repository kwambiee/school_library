require_relative '../classroom'
require_relative '../student'

describe Classroom do
  it 'should have a label' do
    classroom = Classroom.new('A')
    expect(classroom.label).to eq('A')
  end

  it 'should have an empty list of students' do
    classroom = Classroom.new('A')
    expect(classroom.students).to eq([])
  end

  it 'should add a student to the list of students' do
    classroom = Classroom.new('A')
    student = Student.new('John')
    classroom.add_students(student)
    expect(classroom.students).to eq([student])
  end
end
