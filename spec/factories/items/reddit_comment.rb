FactoryBot.define do
  factory :reddit_comment, class: Strigil::RedditComment do
    id 't1_c762re1'
    username 'testname'
    timestamp Time.new(2018, 04, 11, 12, 0, 0, "-04:00")
    content 'example content'
    permalink 'https://www.reddit.com/r/strigil/comments/13pnu0/no_way/c762re1/'
  end
end
