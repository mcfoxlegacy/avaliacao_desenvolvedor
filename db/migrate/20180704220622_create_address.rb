class CreateAddress < ActiveRecord::Migration[5.2]
  def change
    create_table :addresses do |t|
      t.string :name, null: false

      t.timestamps
    end
    add_index :addresses, :name, unique: true
  end
end
