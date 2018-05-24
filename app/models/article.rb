class Article < ApplicationRecord
  validates :title, presence: true, uniqueness: true
  has_many :texts
  has_many :images

  def get_content
    images = Image.eager_load(:article).where(article: self)
    texts = Text.eager_load(:article).where(article: self)
    (images + texts).sort_by(&:order)
  end

end
