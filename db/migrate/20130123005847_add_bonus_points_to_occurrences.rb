class AddBonusPointsToOccurrences < ActiveRecord::Migration
  def change
    add_column :occurrences, :bonus_points, :integer
  end
end
