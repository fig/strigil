def setup_config
  Strigil.configure do |config|
    config.reddit_username = 'strigiltest'
    config.reddit_password = 'testpassword'
  end
end
