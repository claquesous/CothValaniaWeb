class AddMemberIdToOccurrence < ActiveRecord::Migration
  def change
    add_column :occurrences, :member_id, :integer
    add_index :occurrences, :member_id
  end
end
