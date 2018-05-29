class Text < ApplicationRecord
  belongs_to :article
  validates :order, presence: true
  validates :like_number, presence: true, numericality: { greater_than_or_equal_to: 0 }
  before_save :auto_check_order
  default_scope { order(order: :asc) }

  def like
    update(like_number: like_number + 1)
    like_number
  end

  private

  def auto_check_order
    if Image.eager_load(:article).where(article: self.article).pluck(:order).include?(self.order)
      errors.add(:order, 'has existed')
      throw(:abort)
    end
  end

end
