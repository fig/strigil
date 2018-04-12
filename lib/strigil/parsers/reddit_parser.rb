require 'time'

module Strigil
  class RedditParser < Parser

    def self.parse(entry, archiver)
      original_url = archiver.client.current_url
      entry  = find_real_entry(entry, archiver.client)

      result = RedditComment.create(
        post_id: get_id(entry),
        username: get_username(entry),
        posted_at: get_timestamp(entry),
        content: get_content(entry),
        permalink: get_permalink(entry)
      )

      archiver.client.navigate.to original_url
      result
    end

    private

    def self.find_real_entry(entry, client)
      permalink = entry.find_element(link_text: 'permalink').attribute(:href)
      current_url = client.current_url
      client.navigate.to permalink

      client.find_element(class: 'comment')
    end

    def self.get_id(entry)
      entry.attribute('data-fullname')
    end

    def self.get_username(entry)
      entry.attribute('data-author')
    end

    def self.get_timestamp(entry)
      time_data = entry.find_element(tag_name: 'time').attribute(:datetime)
      Time.parse(time_data)
    end

    def self.get_content(entry)
      text_body = entry.find_element(class: 'usertext-body')
      text_body.find_element(class: 'md').text
    end

    def self.get_permalink(entry)
      'https://www.reddit.com' + entry.attribute('data-permalink')
    end
  end
end
