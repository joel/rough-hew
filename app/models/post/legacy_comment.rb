module Post::LegacyComment
  extend ActiveSupport::Concern

  included do
    attr_accessible :comment
  end

  def comment
    puts 'DON\'T USE DEPRECATED method Post#comment' unless Rails.env.test?
    self.comments.first.try(:content)
  end

  def comment=content
    puts 'DON\'T USE DEPRECATED method Post#comment=' unless Rails.env.test?
    unless content.blank?
      hash = { content: content }
      if self.comments.present?
        self.comments.first.update_attributes! hash
      else
        self.comments.new hash
      end
    end
  end

end
