require_relative '../teacher'

describe Teacher do
    person_one = Teacher.new(18,'teaching','John', parent_permission: true)


    describe '#initialize' do
        it 'should initialize with age, name and parent_permission' do
        expect(person_one.age).to eq(18)
        expect(person_one.name).to eq('John')
        expect(person_one.specialization).to eq('teaching')
        expect(person_one.parent_permission).to eq parent_permission:true
        end
    end

    describe '#can_use_services?' do
        it 'should return true if the person is of age or has parent permission' do
        expect(person_one.can_use_services?).to eq(true)
        end
    end
end
