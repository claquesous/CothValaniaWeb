class CreateCharacterRequirements < ActiveRecord::Migration
  def change
    create_table :character_requirements do |t|
      t.references :character
      t.boolean :used
      t.references :obtained_event_occurrence
      t.references :used_event_occurrence

      t.timestamps
    end
    add_index :character_requirements, :character_id
    add_index :character_requirements, :obtained_event_occurrence_id
    add_index :character_requirements, :used_event_occurrence_id
  end
end
