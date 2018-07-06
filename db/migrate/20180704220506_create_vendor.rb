class CreateVendor < ActiveRecord::Migration[5.2]
  def change
    create_table :vendors do |t|
      t.string :name, null: false

      t.timestamps
    end
    add_index :vendors, :name, unique: true
  end
end
