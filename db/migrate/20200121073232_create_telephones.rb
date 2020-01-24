class CreateTelephones < ActiveRecord::Migration[5.2]
  def change
    create_table :telephones do |t|
      t.string :phone_number,   null: false, unique: true
      t.integer :user_id, foreign_key: true

      t.timestamps
    end
  end
end
