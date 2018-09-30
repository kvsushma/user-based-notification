class AddColumnToSectors < ActiveRecord::Migration[5.2]
  def change
    add_column :sectors, :post, :text
  end
end
