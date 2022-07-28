require_relative '../person'

describe Person do
    let(:person) { Person.new(18, 'John Doe') }
    let(:rental) { Rental.new(1, 'A', 'B') }

    describe '#initialize' do
        it 'should initialize with age, name and parent_permission' do
        expect(person.age).to eq(18)
        expect(person.name).to eq('John Doe')
        expect(person.parent_permission).to eq true
        end
    end

    describe '#can_use_services?' do
        it 'should return true if the person is of age or has parent permission' do
        expect(person.can_use_services?).to eq(true)
        end
        it 'should return false if the person is not of age and does not have parent permission' do
        person.age = 17
        person.parent_permission = false
        expect(person.can_use_services?).to eq(false)
        end
    end

    describe '#correct_name' do
        it 'should return the name' do
        expect(person.correct_name).to eq('John Doe')
        end
    end
end