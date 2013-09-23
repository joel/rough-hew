class Comment < ActiveRecord::Base
  attr_accessible :content, :post
  belongs_to :post

  validates :post, associated: true
  validates :post, presence: true
  validates :post_id, numericality: true, allow_blank: true

  validates :content, presence: true
end
