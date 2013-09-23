FactoryGirl.define do
  sequence :post_title do |n|
    "title-#{n}-#{rand(10000 * n)}"
  end
  sequence :comment do |n|
    "comment_content-#{n}-#{rand(1000)}"
  end
end
