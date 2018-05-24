class CreateImages < ActiveRecord::Migration[5.2]
  def change
    create_table :images do |t|
      t.string :headline
      t.decimal :order
      t.integer :like, default: 0

      t.timestamps
    end
  end
end
