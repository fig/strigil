RSpec.describe Strigil do
  describe '#configure' do
    it 'allows configuration of module' do
      test_reddit_username = 'RedditTest'
      test_reddit_password = 'password'

      Strigil.configure do |config|
        config.reddit_username = test_reddit_username
        config.reddit_password = test_reddit_password
      end

      expect(Strigil.configuration.reddit_username).to eq(test_reddit_username)
      expect(Strigil.configuration.reddit_password).to eq(test_reddit_password)
    end 
  end
end
