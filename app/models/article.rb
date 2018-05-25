class Article < ApplicationRecord
  validates :title, presence: true
  has_many :texts
  has_many :images

  def get_texts_images_instances
    images = Image.eager_load(:article).where(article: self)
    texts = Text.eager_load(:article).where(article: self)
    (images + texts).sort_by(&:order)
    # or (images + texts).sort_by{ |i| i.order }

  end

  def show_content
    self.get_texts_images_instances.map { |item| item.class.name == 'Image' ? "<img src=#{item.url.inspect}//>".html_safe : item.sentences }
  end

  def published?
    return false if self.new_record?
  end

  def make_finish    
    self.published? || self.created_at = DateTime.now
  end

  def finish?
    return false if self.created_at.nil?
    self.created_at < DateTime.now
  end

  def like
    self.like_number += 1
  end

end
