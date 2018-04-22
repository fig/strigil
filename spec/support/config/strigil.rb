require './lib/strigil'

def setup_config
  Strigil.configure do |config|
    config.user_agent      = 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/47.0.2526.111 Safari/537.36'

    config.reddit_username = 'strigiltest'
    config.reddit_password = 'testpassword'
  end
end

RSpec.configure do |config|
  config.before(:each) do
    setup_config
    Strigil::RedditController.pool.clear
  end
end
