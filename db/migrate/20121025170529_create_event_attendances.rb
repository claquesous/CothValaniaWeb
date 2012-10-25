class CreateEventAttendances < ActiveRecord::Migration
  def change
    create_table :event_attendances do |t|
      t.references :event_occurrence
      t.references :character

      t.timestamps
    end
    add_index :event_attendances, :event_occurrence_id
    add_index :event_attendances, :character_id
  end
end
