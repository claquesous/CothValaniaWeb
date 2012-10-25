class CreateShouts < ActiveRecord::Migration
  def change
    create_table :shouts do |t|
      t.text :text
      t.datetime :date
      t.references :character

      t.timestamps
    end
    add_index :shouts, :character_id
  end
end
