class CreateFileImports < ActiveRecord::Migration[5.2]
  def change
    create_table :file_imports do |t|
      t.string :filename
      t.text :content
      t.timestamps
    end
  end
end