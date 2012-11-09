class AddMemberToCharacterReward < ActiveRecord::Migration
  def change
    add_column :character_rewards, :member_id, :integer
    add_index :character_rewards, :member_id
  end
end
