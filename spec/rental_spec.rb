require_relative '../rental'

describe Rental do
    let(:rental) { Rental.new('A','B','2022-01-01') }

    describe '#initialize' do
        it 'should initialize with a person, book and date' do
        expect(rental.person).to eq('A')
        expect(rental.book).to eq('B')
        expect(rental.date).to eq('2022-01-01')
        end
    end
    end