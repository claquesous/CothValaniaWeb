class ChangeRequirementsNameToString < ActiveRecord::Migration
  def up
    change_column(:requirements, :name, :string)
    add_column(:requirements, :multiple, :boolean)
  end

  def down
    change_column(:requirements, :name, :text)
    remove_column(:requirements, :multiple)
  end
end
