class RenameEventOccurrencesOccurrences < ActiveRecord::Migration
  def up
    rename_table :event_occurrences, :occurrences
    rename_column :character_requirements, :obtained_event_occurrence_id, :obtained_occurrence_id
    add_index :character_requirements, :obtained_occurrence_id
    remove_index :character_requirements, :obtained_event_occurrence_id
    rename_column :character_requirements, :used_event_occurrence_id, :used_occurrence_id
    add_index :character_requirements, :used_occurrence_id
    remove_index :character_requirements, :used_event_occurrence_id
    rename_column :character_rewards, :event_occurrence_id, :occurrence_id
    add_index :character_rewards, :occurrence_id
    remove_index :character_rewards, :event_occurrence_id
    rename_column :event_attendances, :event_occurrence_id, :occurrence_id
    add_index :event_attendances, :occurrence_id
    remove_index :event_attendances, :event_occurrence_id
  end

  def down
    rename_table :occurrences, :event_occurrences
    rename_column :character_requirements, :used_occurrence_id, :used_event_occurrence_id
    add_index :character_requirements, :used_event_occurrence_id
    remove_index :character_requirements, :used_occurrence_id
    rename_column :character_requirements, :obtained_occurrence_id, :obtained_event_occurrence_id
    add_index :character_requirements, :obtained_event_occurrence_id
    remove_index :character_requirements, :obtained_occurrence_id
    rename_column :character_rewards, :occurrence_id, :event_occurrence_id
    add_index :character_rewards, :event_occurrence_id
    remove_index :character_rewards, :occurrence_id
    rename_column :event_attendances, :occurrence_id, :event_occurrence_id
    add_index :event_attendances, :event_occurrence_id
    remove_index :event_attendances, :occurrence_id
  end
end
