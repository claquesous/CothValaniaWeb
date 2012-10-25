class AddRequirementsMixableToEvent < ActiveRecord::Migration
  def change
    add_column :events, :requirements_mixable, :boolean
  end
end
