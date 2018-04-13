require './spec/support/fake_reddit_client'

RSpec.describe Strigil::RedditWorker do
  describe '.perform' do
    before(:each) do
      # Forces RedditWorker to use a fake client to retrieve good data
      @worker = Strigil::RedditWorker.new(FakeRedditWebClient)
      @permalink = attributes_for(:reddit_comment)[:permalink]
    end

    it 'creates a new comment from a permalink' do
      expect(Strigil::RedditComment.count).to eq(0)

      @worker.perform(@permalink)

      expect(Strigil::RedditComment.count).to eq(1)
    end

    it 'succeeds even if comment already is stored' do
      expect(Strigil::RedditComment.count).to eq(0)

      @worker.perform(@permalink)
      @worker.perform(@permalink)

      expect(Strigil::RedditComment.count).to eq(1)
    end
  end
end
