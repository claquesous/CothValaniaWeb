class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :name
      t.integer :points
      t.string :remarks
      t.boolean :hidden
      t.time :time

      t.timestamps
    end
  end
end
