class Article < ApplicationRecord
  validates :title, presence: true
  validates :like_number, presence: true, numericality: { greater_than_or_equal_to: 0 }
  has_many :texts
  has_many :images
  alias_attribute :published_time, :created_at

  def get_texts_images_instances
    images = Image.eager_load(:article).where(article: self)
    texts = Text.eager_load(:article).where(article: self)
    (images + texts).sort_by(&:order)
    # or (images + texts).sort_by{ |i| i.order }
  end

  def show_content
    get_texts_images_instances.map { |item| item.class.name == 'Image' ? "<img src=#{item.url.inspect}//>".html_safe : item.sentences }
  end

  def published?
    !new_record?
  end

  def make_finish
    published? || self.created_at = DateTime.now
  end

  def finish?
    return false if created_at.nil?
    created_at < DateTime.now
  end

  def like
    update(like_number: like_number + 1)
    like_number
  end
end
