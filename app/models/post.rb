class Post < ActiveRecord::Base
  include Post::LegacyComment

  attr_accessible :content, :title

  validates :title, presence: true, uniqueness: true
  validates :content, presence: true

  has_many :comments, dependent: :delete_all

  scope :with_comment, -> { joins(:comments).select('posts.*, comments.content as comment') }
end
