class CreateNews < ActiveRecord::Migration
  def change
    create_table :news do |t|
      t.text :text
      t.datetime :date
      t.references :character

      t.timestamps
    end
    add_index :news, :character_id
  end
end
