class CreateRequirementAttainments < ActiveRecord::Migration
  def change
    create_table :requirement_attainments do |t|
      t.references :event
      t.references :requirement

      t.timestamps
    end
    add_index :requirement_attainments, :event_id
    add_index :requirement_attainments, :requirement_id
  end
end
