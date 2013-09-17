# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :post do
    title { generate(:post_title) }
    sequence(:content) { |n| "content-#{n}-#{rand(1000)}"}
    sequence(:comment) { |n| "comment-#{n}-#{rand(1000)}"}
  end
end
