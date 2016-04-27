class CreateRegisters < ActiveRecord::Migration
  def change
    create_table :registers do |t|
      t.string :buyer
      t.text :description
      t.decimal :unity_price
      t.integer :quantity
      t.text :address
      t.string :supplier

      t.timestamps null: false
    end
  end
end
