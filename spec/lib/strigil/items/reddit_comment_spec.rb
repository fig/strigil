RSpec.describe Strigil::RedditComment do
  describe '.initialize' do
    it 'initializes correctly with data' do
      params = attributes_for :reddit_comment

      comment = Strigil::RedditComment.new(params)

      expect(comment.source).to eq(:reddit)
      expect(comment.username).to eq(params[:username])
    end
  end
end
