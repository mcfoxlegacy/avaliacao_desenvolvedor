class CreateSale < ActiveRecord::Migration[5.2]
  def change
    create_table :sales do |t|
      t.text :description, null: false
      t.decimal :unit_price, null: false
      t.integer :quantity, null: false
      t.belongs_to :vendor, index: true
      t.belongs_to :customer, index: true
      t.belongs_to :address, index: true
      
      t.timestamps
    end
  end
end
