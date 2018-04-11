require 'selenium-webdriver'
require 'webdrivers'

module Strigil
  class Archiver
    Credentials = Struct.new(:username, :password)
    attr_reader :client, :credentials
    attr_accessor :target, :entries

    def initialize
      @credentials = set_credentials
      @entries = Strigil::ItemCollection.new
    end

    def initialize_client
      unless @client
        options = Selenium::WebDriver::Chrome::Options.new
        options.add_argument('headless')

        @client = Selenium::WebDriver.for :chrome, options: options
      end
    end

    def set_target(target)
      @target = target
    end

    def get_entries
      raise NoMethodError, "Must implement get_next_entry method for #{self.class}"
    end

    private

    def set_credentials
      raise NoMethodError, "Must implement credentials for #{self.class}"
    end
  end
end
