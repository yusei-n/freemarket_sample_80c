class CreateAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :addresses do |t|
      t.references :user, foreign_key: true
      t.string :last_name, null: false
      t.string :first_name, null: false
      t.string :last_name_hurigana, null: false
      t.string :first_name_hurigana, null: false
      t.date :birthday, null: false
      t.integer :postal_number, null: false
      t.integer :postal_prefectures_id, null: false
      t.integer :postal_municipalities, null: false
      t.string :postal_address, null: false
      t.string :post_apartment
      t.string :tell_number
      t.timestamps
    end
  end
end
