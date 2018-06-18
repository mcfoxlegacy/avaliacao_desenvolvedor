class AddFileImportToSales < ActiveRecord::Migration[5.2]
  def change
    add_column :sales, :file_import_id, :integer
    add_index :sales, :file_import_id
  end
end
