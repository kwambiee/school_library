require_relative '../decorator'
require_relative '../trimmer'
require_relative '../capitalize'

describe Decorator do
  nameable = 'manchesterunited'
  describe '#capitalize' do
    it 'should return the name with the first letter capitalized' do
      expect(nameable.capitalize).to eq('Manchesterunited')
    end
  end

  describe '#trim' do
    it 'should return the name with the first letter capitalized' do
      expect(nameable[0, 10]).to eq('manchester')
    end
  end
end
