class CreateArticles < ActiveRecord::Migration[5.2]
  def change
    create_table :articles do |t|
      t.string :title
      t.timestamp :created_at
      t.integer :like
    end
  end
end
