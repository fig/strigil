module Strigil
  class Entry
    attr_accessor :object
    attr_reader :client

    def initialize(params)
      @object = params[:object]
      @client = params[:client]
    end
  end
end
