module Strigil
  class RedditArchiver < Archiver

    def test_get_entry
      initialize_client
      client.navigate.to 'https://reddit.com/u/strigiltest/comments'
      client.find_element(class: "CommentListing__comment")
    end

    private

    def set_credentials
      Credentials.new(
        Strigil.configuration.reddit_username,
        Strigil.configuration.reddit_password
      )
    end
  end
end
