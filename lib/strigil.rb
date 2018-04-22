lib = File.expand_path('strigil', __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

module Strigil
  class << self
    attr_accessor :configuration
  end

  def self.configure
    self.configuration ||= Configuration.new
    yield(configuration)
  end

  class Configuration
    attr_accessor :user_agent, :reddit_username, :reddit_password, :redis_url
  end
end

require 'active_record'
require 'byebug'
require 'sidekiq'

# -----------------------------

require 'web_client'
require 'clients/reddit_web_client'

require 'controller'
require 'controllers/reddit_controller'

require 'models/reddit_comment'

require 'worker'
require 'workers/reddit_worker'

# -----------------------------

require './lib/strigil_initializer.rb'
