class AddRaceToCharacter < ActiveRecord::Migration
  def change
    add_column :characters, :race_id, :integer
    add_index :characters, :race_id
  end
end
