# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :comment do

    ignore do
      title { generate :category_title }
    end

    association :post, strategy: :build
    sequence(:content) { |n| "content-#{n}-#{rand(1000)}"}

    # Becareful with default association on build, you probably want a naked build, here it will never possible :/
    after(:build) do |comment, evaluator|
      comment.categories << build(:category, title: evaluator.title) #, comment: comment)
    end

    trait :with_categories do
      # ignore do
      #   title { generate :category_title }
      # end
      after(:build) do |comment, evaluator|
        comment.categories << build(:category, title: evaluator.title) #, comment: comment)
      end
    end
  end
end
