RSpec.describe Strigil::RedditArchiver do
  describe 'initialize' do
    it 'initializes with credentials' do
      setup_config

      archiver = Strigil::RedditArchiver.new

      expect(archiver.credentials.username).to eq(Strigil.configuration.reddit_username)
      expect(archiver.credentials.password).to eq(Strigil.configuration.reddit_password)
    end
  end

  describe '.set_target' do
    it 'sets the target' do
      setup_config
      archiver = Strigil::RedditArchiver.new
      target = 'jobtraining101'

      archiver.set_target(target)

      expect(archiver.target).to eq(target)
    end
  end
end
