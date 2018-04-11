module Strigil
  class RedditEntry < Entry
    def initialize(params)
      super
      @object = find_real_object(@object)
    end

    private

    def find_real_object(obj)
      permalink = obj.find_element(link_text: 'permalink').attribute(:href)
      @client.navigate.to permalink
      @client.find_element(class: 'comment')
    end
  end
end
