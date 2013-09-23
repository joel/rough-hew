# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :post do

    ignore do
      comment { generate(:comment) }
    end

    title { generate(:post_title) }

    sequence(:content) { |n| "post_content-#{n}-#{rand(1000)}"}

    # Becareful with default association on build, you probably want a naked build, here it will never possible :/
    after(:build) do |post, evaluator|
      post.comments << build(:comment, content: evaluator.comment, post: post)
    end

    trait :with_comments do
      after(:build) do |post, evaluator|
        2.times do
          post.comments << build(:comment, content: evaluator.comment, post: post)
        end
      end
    end

  end
end
