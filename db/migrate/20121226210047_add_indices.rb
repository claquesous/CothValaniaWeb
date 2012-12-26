class AddIndices < ActiveRecord::Migration
  def change
    add_index :characters, :member_id
    add_index :character_rewards, :obtained
    add_index :events, :name
    add_index :events, :hidden
    add_index :event_rewards, :event_id
    add_index :event_rewards, :reward_id
    add_index :jobs, :name
    add_index :members, :name
    add_index :members, :active
    add_index :members, :admin
    add_index :members, :leader
    add_index :news, :date
    add_index :occurrences, :success
    add_index :occurrences, :end_time
    add_index :occurrences, :optional
    add_index :occurrences, :event_id
    add_index :races, :name
    add_index :requirements, :name
    add_index :rewards, :name
    add_index :shouts, :date
  end
end
