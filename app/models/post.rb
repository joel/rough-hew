class Post < ActiveRecord::Base
  include Post::LegacyComment

  attr_accessible :content, :title

  validates :title, presence: true, uniqueness: true
  validates :content, presence: true

  has_many :comments, dependent: :delete_all
end
