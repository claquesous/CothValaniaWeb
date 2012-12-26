class AddCharacterJobToEventAttendance < ActiveRecord::Migration
  def change
    add_column :event_attendances, :character_job_id, :integer
    add_index :event_attendances, :character_job_id
  end
end
