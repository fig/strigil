RSpec.describe Strigil::RedditComment do
  describe 'validations' do
    it 'validates with correct data' do
      params = attributes_for :reddit_comment

      comment = Strigil::RedditComment.new(params)

      expect(comment).to be_valid 
    end
  end
end
