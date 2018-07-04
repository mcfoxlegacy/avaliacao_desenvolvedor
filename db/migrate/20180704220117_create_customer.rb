class CreateCustomer < ActiveRecord::Migration[5.2]
  def change
    create_table :customers do |t|
      t.string :name, null: false

      t.timestamps
    end
    add_index :customers, :name, unique: true
  end
end
