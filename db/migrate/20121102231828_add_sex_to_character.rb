class AddSexToCharacter < ActiveRecord::Migration
  def change
    add_column :characters, :sex, :integer
  end
end
