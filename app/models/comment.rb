class Comment < ActiveRecord::Base
  attr_accessible :content, :post

  belongs_to :post
  has_and_belongs_to_many :categories, before_add: :validate_category

  validates :post, associated: true
  validates :post, presence: true
  validates :post_id, numericality: true, allow_blank: true

  validates :content, presence: true


  def validate_category category
    raise ActiveRecord::Rollback if self.categories.include?(category)
  end

end
