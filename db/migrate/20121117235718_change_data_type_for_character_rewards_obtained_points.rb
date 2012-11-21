class ChangeDataTypeForCharacterRewardsObtainedPoints < ActiveRecord::Migration
  def up
    change_table :character_rewards do |t|
      t.change :obtained_points, :float
    end
  end

  def down
    change_table :character_rewards do |t|
      t.change :obtained_points, :integer
    end
  end
end
