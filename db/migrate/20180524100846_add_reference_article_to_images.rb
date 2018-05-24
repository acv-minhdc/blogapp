class AddReferenceArticleToImages < ActiveRecord::Migration[5.2]
  def change
    add_reference :images, :article, index: true
  end
end
