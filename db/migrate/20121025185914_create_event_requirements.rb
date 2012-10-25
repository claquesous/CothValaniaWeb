class CreateEventRequirements < ActiveRecord::Migration
  def change
    create_table :event_requirements do |t|
      t.references :requirement
      t.references :event

      t.timestamps
    end
    add_index :event_requirements, :requirement_id
    add_index :event_requirements, :event_id
  end
end
