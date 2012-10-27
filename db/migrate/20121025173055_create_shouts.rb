class CreateShouts < ActiveRecord::Migration
  def change
    create_table :shouts do |t|
      t.text :text
      t.datetime :date
      t.references :member

      t.timestamps
    end
    add_index :shouts, :member_id
  end
end
