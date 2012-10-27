class CreateRequirementObtainments < ActiveRecord::Migration
  def change
    create_table :requirement_obtainments do |t|
      t.references :event
      t.references :requirement

      t.timestamps
    end
    add_index :requirement_obtainments, :event_id
    add_index :requirement_obtainments, :requirement_id
  end
end
