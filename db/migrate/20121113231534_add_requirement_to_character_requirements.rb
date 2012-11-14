class AddRequirementToCharacterRequirements < ActiveRecord::Migration
  def change
    add_column :character_requirements, :requirement_id, :integer
    add_index :character_requirements, :requirement_id
  end
end
