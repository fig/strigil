module Strigil
  class Parser
    def self.parse(entry, client = nil)
      raise NoMethodError, "Must implement self.parse for #{self.class}"
    end
  end
end
