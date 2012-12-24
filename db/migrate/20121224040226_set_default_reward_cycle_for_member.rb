class SetDefaultRewardCycleForMember < ActiveRecord::Migration
  def up
    change_column_default :members, :reward_cycle, 1
  end

  def down
  end
end
