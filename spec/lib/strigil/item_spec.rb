RSpec.describe Strigil::Item do
  describe '.initialize' do
    it 'raises NoMethodError without a set source' do
      expect { Strigil::Item.new({}) }.to raise_error NoMethodError
    end
  end
end
