class AddReferenceArticleToTexts < ActiveRecord::Migration[5.2]
  def change
    add_reference :texts, :article, index: true
  end
end
