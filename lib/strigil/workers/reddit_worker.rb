module Strigil
  class RedditWorker < Worker
    # Able to pass a fake client class for testing
    def initialize(fake_client = nil)
      @requester_class = fake_client || RedditClient
    end

    def perform(permalink)
      params = @requester_class.pull_params(permalink)

      unless RedditComment.exists?(permalink: permalink)
        RedditComment.create(params)
        RedditController.pool.delete(permalink)
      end
    end
  end
end
