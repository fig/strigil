RSpec.describe Strigil::Archiver do
  describe '.initialize' do
    it 'raises NoMethodError without credentials' do
      expect { Strigil::Archiver.new }.to raise_error NoMethodError
    end
  end
end
