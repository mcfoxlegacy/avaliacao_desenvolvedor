class FixColumnName < ActiveRecord::Migration
  def change
    rename_column :buyers, :nome, :name
  end
end
