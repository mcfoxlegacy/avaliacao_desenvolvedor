class CreateSales < ActiveRecord::Migration
  def change
    create_table :sales do |t|
      t.references :buyer, index: true, foreign_key: true
      t.string :description
      t.decimal :price
      t.integer :quantity
      t.references :supplier, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
