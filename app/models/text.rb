class Text < ApplicationRecord
  belongs_to :article
  validates :order, presence: true
  default_scope { order(order: :asc) }

  def like
    self.like_number += 1
  end
end
