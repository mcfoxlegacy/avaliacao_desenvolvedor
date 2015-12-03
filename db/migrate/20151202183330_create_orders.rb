class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.string :buyer
      t.text :description
      t.decimal :unity_price
      t.integer :quantity
      t.string :address
      t.string :customer

      t.timestamps null: false
    end
  end
end
