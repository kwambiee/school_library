require_relative '../student'

describe Student do
    let(:student) { Student.new(18,'John Doe') }

    describe '#initialize' do
        it 'should initialize with age, name and parent_permission' do
        expect(student.age).to eq(18)
        expect(student.name).to eq('John Doe')
        expect(student.parent_permission).to eq parent_permission:true
        end
    end

    describe '#play_hooky' do
        it 'should return "¯\(ツ)/¯"' do
        expect(student.play_hooky).to eq("¯\(ツ)/¯")
        end
    end

    describe '#classroom=' do
        it 'should add the student to the classroom' do
        classroom = Classroom.new(name: '1A')
        student.classroom = classroom
        expect(student.classroom).to eq(classroom)
        expect(classroom.students).to include(student)
        end
    end
    end