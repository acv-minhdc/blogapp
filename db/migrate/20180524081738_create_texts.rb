class CreateTexts < ActiveRecord::Migration[5.2]
  def change
    create_table :texts do |t|
      t.string :headline
      t.decimal :order
      t.text :sentences
      t.integer :like, default: 0

      t.timestamps
    end
  end
end
