class CreateProducts < ActiveRecord::Migration[6.0]
  def change
    create_table :products do |t|
      t.references :user, foreign_key: true
      t.references :image, foreign_key: true
      t.string :title,null: false
      t.integer :price,null: false
      t.text :explanation,null: false
      t.integer :delivery_burden_id,null: false
      t.integer :product_status_id,null: false
      t.integer :estimated_shipping_id,null: false
      t.integer :category_id, null: false
      t.integer :postal_prefectures_id,null: false
      t.text :brand
      t.timestamps
    end
  end
end
