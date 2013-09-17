FactoryGirl.define do
  sequence :post_title do |n|
    "title-#{n}-#{rand(10000 * n)}"
  end
end
