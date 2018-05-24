class Image < ApplicationRecord
  belongs_to :article
  default_scope { order(order: :asc) }

  def like
    self.like_number += 1
  end
end
