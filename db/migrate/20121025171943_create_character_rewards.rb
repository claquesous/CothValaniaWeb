class CreateCharacterRewards < ActiveRecord::Migration
  def change
    create_table :character_rewards do |t|
      t.references :character
      t.references :reward
      t.references :event_occurrence
      t.integer :preference
      t.boolean :obtained
      t.integer :reward_cycle
      t.integer :obtained_points
      t.string :remarks

      t.timestamps
    end
    add_index :character_rewards, :character_id
    add_index :character_rewards, :reward_id
    add_index :character_rewards, :event_occurrence_id
  end
end
