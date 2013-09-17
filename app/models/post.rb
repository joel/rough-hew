class Post < ActiveRecord::Base
  attr_accessible :comment, :content, :title

  validates :title, presence: true, uniqueness: true
  validates :content, presence: true
  validates :comment, presence: true
end
