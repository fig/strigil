RSpec.describe Strigil::RedditParser do
  describe '#parse' do
    it 'takes a Selenium object and returns a RedditComment' do
      setup_config
      archiver = Strigil::RedditArchiver.new
      object = archiver.test_get_entry

      result = Strigil::RedditParser.parse(object, archiver)

      expect(result).to be_instance_of(Strigil::RedditComment)
      expect(result.username).to eq('strigiltest')
      expect(result.content).to include 'test comment content'
    end
  end
end
