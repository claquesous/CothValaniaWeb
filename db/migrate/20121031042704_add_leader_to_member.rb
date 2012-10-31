class AddLeaderToMember < ActiveRecord::Migration
  def change
    add_column :members, :leader, :boolean
  end
end
