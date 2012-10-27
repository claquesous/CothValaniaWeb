class CreateNews < ActiveRecord::Migration
  def change
    create_table :news do |t|
      t.text :text
      t.datetime :date
      t.references :member

      t.timestamps
    end
    add_index :news, :member_id
  end
end
