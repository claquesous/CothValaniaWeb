class CreateRewards < ActiveRecord::Migration
  def change
    create_table :rewards do |t|
      t.string :name
      t.integer :external_value
      t.string :remarks

      t.timestamps
    end
  end
end
