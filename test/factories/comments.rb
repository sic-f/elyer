FactoryBot.define do
  factory :comment do
    content { FFaker::Tweet.tweet }    
    user
  end
end
