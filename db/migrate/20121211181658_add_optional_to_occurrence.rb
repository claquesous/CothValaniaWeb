class AddOptionalToOccurrence < ActiveRecord::Migration
  def change
    add_column :occurrences, :optional, :boolean
  end
end
