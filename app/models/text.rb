class Text < ApplicationRecord
  belongs_to :article
  before_save :set_order
  # default_scope { order(order: :asc) }

  def set_order
    # self.article.get_content
  end

end
