class CreateRequirements < ActiveRecord::Migration
  def change
    create_table :requirements do |t|
      t.text :name
      t.boolean :reusable

      t.timestamps
    end
  end
end
