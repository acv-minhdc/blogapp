class Article < ApplicationRecord
  validates :title, presence: true
  has_many :texts
  has_many :images
  scopeL

  def get_texts_images_instance
    images = Image.eager_load(:article).where(article: self)
    texts = Text.eager_load(:article).where(article: self)
    (images + texts).sort_by(&:order)
    # or (images + texts).sort_by{ |i| i.order }
  end

  def show_content
    self.get_content.map { |item| item.class.name == 'Image' ? "<img src = #{item.url.inspect}//>".html_safe : item.sentences }
  end

  def published?
    created_at < DateTime.now
  end

  def make_published
    self.created_at = DateTime.now
  end

  def like
    self.like_number += 1
  end

end
