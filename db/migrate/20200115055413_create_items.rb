class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.string :name, null: false
      t.integer :price, null: false
      t.text :text, null: false
      t.integer :user_id, foreign_key: true
      t.string :condition, null: false
      t.string :size
      t.string :way, null: false
      t.string :date, null: false
      t.string :berser,null: false
      t.string :region,null: false
      t.integer :category_id
      t.integer :brand_id
      t.timestamps

    end
  end
end
