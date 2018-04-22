# Controller for Reddit Target
module Strigil
  class RedditController < Controller
    @@pool = Set.new
    attr_reader :target, :head

    def self.pool
      @@pool
    end

    def initialize(target)
      @target = target
      @head = RedditWebClient.new
    end

    def archive(permalink)
      unless RedditController.pool.include?(permalink) || RedditComment.exists?(permalink: permalink)
        RedditWorker.perform_async(permalink)
        RedditController.pool.add(permalink)
      end
    end
  end
end
