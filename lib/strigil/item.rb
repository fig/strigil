module Strigil
  class Item
    attr_accessor :source, :id, :username, :timestamp, :content, :permalink

    def initialize(params)
      @source     = item_source
      @id         = params[:id]
      @username   = params[:username]
      @timestamp  = params[:timestamp]
      @content    = params[:content]
      @permalink  = params[:permalink]
    end

    private

    def item_source
      raise NoMethodError, "Must set item_source method for #{self.class}"
    end
  end
end
