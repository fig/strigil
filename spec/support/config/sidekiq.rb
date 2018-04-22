require 'sidekiq/testing'

RSpec.configure do |config|
  config.before(:each) do
    Sidekiq::Worker.clear_all
  end
end

Sidekiq::Testing.fake!
