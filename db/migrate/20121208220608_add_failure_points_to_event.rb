class AddFailurePointsToEvent < ActiveRecord::Migration
  def change
    add_column :events, :failure_points, :integer
  end
end
