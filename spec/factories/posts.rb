# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :post do

    ignore do
      comment { generate(:comment) }
    end

    title { generate(:post_title) }
    sequence(:content) { |n| "content-#{n}-#{rand(1000)}"}

    after(:build) do |post, evaluator|
      post.comments.new attributes_for(:comment).merge!(content: evaluator.comment)
    end

    trait :with_comments do
      after(:build) do |post, evaluator|
        2.times do
          post.comments.new attributes_for(:comment)
        end
      end
    end

  end
end
