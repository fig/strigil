RSpec.describe Strigil::RedditController do
  describe 'initialize' do
    it 'sets a target' do
      target = Strigil.configuration.reddit_username

      controller = Strigil::RedditController.new(target)

      expect(controller.target).to eq(target)
    end
  end

  describe '#pool' do
    it 'returns a hashset of pooled permalinks' do
      result = Strigil::RedditController.pool

      expect(result).to be_instance_of(Set)
    end
  end

  describe '.archive' do
    before(:each) do
      target = Strigil.configuration.reddit_username
      @controller = Strigil::RedditController.new(target)
    end

    context 'input exists in model but not pool' do
      it 'does not queue' do
        create :reddit_comment
        permalink = attributes_for(:reddit_comment)[:permalink]
        expect(Strigil::RedditController.pool.size).to eq(0)
        expect(Strigil::RedditWorker.jobs.size).to eq(0)

        @controller.archive(permalink)

        expect(Strigil::RedditController.pool.size).to eq(0)
        expect(Strigil::RedditWorker.jobs.size).to eq(0)
      end
    end

    context 'input exists in pool but not model' do
      it 'does not queue' do
        permalink = attributes_for(:reddit_comment)[:permalink]
        Strigil::RedditController.pool.add(permalink)
        expect(Strigil::RedditController.pool.size).to eq(1)
        expect(Strigil::RedditWorker.jobs.size).to eq(0)

        @controller.archive(permalink)

        expect(Strigil::RedditController.pool.size).to eq(1)
        expect(Strigil::RedditWorker.jobs.size).to eq(0)
      end
    end

    context 'input does not exist in model or pool' do
      it 'queues' do
        permalink = attributes_for(:reddit_comment)[:permalink]
        expect(Strigil::RedditController.pool.size).to eq(0)
        expect(Strigil::RedditWorker.jobs.size).to eq(0)

        @controller.archive(permalink)

        expect(Strigil::RedditController.pool.size).to eq(1)
        expect(Strigil::RedditWorker.jobs.size).to eq(1)
      end
    end
  end
end
