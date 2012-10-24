class CreateMembers < ActiveRecord::Migration
  def change
    create_table :members do |t|
      t.string :name
      t.string :password
      t.date :join_date
      t.string :url
      t.string :remarks
      t.boolean :active
      t.boolean :admin
      t.integer :reward_cycle
      t.date :cycle_date

      t.timestamps
    end
  end
end
