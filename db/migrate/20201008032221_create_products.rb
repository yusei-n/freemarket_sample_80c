class CreateProducts < ActiveRecord::Migration[6.0]
  def change
    create_table :products do |t|
      t.references :user, foreign_key: true, null: false
      t.string :title, null: false
      t.integer :price, null: false
      t.text :explanation, null: false
      t.integer :delivery_burden_id, null: false
      t.integer :product_status_id, null: false
      t.integer :estimated_shipping_id, null: false
      t.timestamps
    end
  end
end
