class DeleteUsedFromCharacterRequirements < ActiveRecord::Migration
  def up
    remove_column :character_requirements, :used
  end

  def down
    add_column :character_requirements, :used, :boolean
  end
end
