lib = File.expand_path("../strigil", __FILE__)
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
    attr_accessor :reddit_username, :reddit_password
  end
end

require 'byebug'

require 'archiver'
require 'archivers/reddit_archiver'

require 'archivers/entry'
require 'archivers/entries/reddit_entry'

require 'client'
require 'clients/reddit_client'

require 'item_collection'

require 'item'
require 'items/reddit_comment'

require 'parser'
require 'parsers/reddit_parser'
