class AddPointsToMembersAndCharacters < ActiveRecord::Migration
  def up
    add_column :members, :current_points, :integer, default: 0
    add_column :members, :total_points, :integer, default: 0
    add_column :characters, :current_points, :integer, default: 0
    add_column :characters, :total_points, :integer, default: 0

    Member.all.each do |member|
      member.update_attribute(:current_points, member.current_points)
      member.update_attribute(:total_points, member.points)
    end
    Character.all.each do |character|
      character.update_attribute(:current_points, character.current_points)
      character.update_attribute(:total_points, character.points)
    end
  end

  def down
    remove_column :members, :current_points
    remove_column :members, :total_points
    remove_column :characters, :current_points
    remove_column :characters, :total_points
  end
end
