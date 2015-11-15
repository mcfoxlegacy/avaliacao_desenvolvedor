class CreateBuyers < ActiveRecord::Migration
  def change
    create_table :buyers do |t|
      t.string :nome

      t.timestamps null: false
    end
  end
end
