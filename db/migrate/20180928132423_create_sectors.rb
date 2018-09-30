class CreateSectors < ActiveRecord::Migration[5.2]
  def change
    create_table :sectors do |t|
      t.integer :user_id
      t.integer :role_id
      t.string :sector_name

      t.timestamps
    end
  end
end
