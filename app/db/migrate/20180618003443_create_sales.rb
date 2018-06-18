class CreateSales < ActiveRecord::Migration[5.2]
  def change
    create_table :sales do |t|
      t.string :client, :precision => 8, :scale => 2
      t.string :description
      t.decimal :unit_price
      t.integer :quantity
      t.string :address
      t.string :supplier

      t.timestamps
    end
  end
end
