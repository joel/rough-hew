# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :comment do
    association :post, strategy: :build
    sequence(:content) { |n| "content-#{n}-#{rand(1000)}"}
  end
end
