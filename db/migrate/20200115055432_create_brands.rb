class CreateBrands < ActiveRecord::Migration[5.2]
  def change
    create_table :brands do |t|
      t.string :name, null: false
      t.integer :category_id, foreign_key: true
      t.timestamps
    end
  end
end
