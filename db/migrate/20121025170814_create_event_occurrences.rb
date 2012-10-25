class CreateEventOccurrences < ActiveRecord::Migration
  def change
    create_table :event_occurrences do |t|
      t.string :remarks
      t.datetime :start_time
      t.datetime :end_time
      t.boolean :success

      t.timestamps
    end
  end
end
