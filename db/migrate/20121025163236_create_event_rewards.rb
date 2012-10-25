class CreateEventRewards < ActiveRecord::Migration
  def change
    create_table :event_rewards do |t|
      t.references :event
      t.references :reward
      t.timestamps
    end
  end
end
