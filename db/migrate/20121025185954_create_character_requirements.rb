class CreateCharacterRequirements < ActiveRecord::Migration
  def change
    create_table :character_requirements do |t|
      t.references :requirement_attainment
      t.references :character
      t.datetime :obtained_date
      t.datetime :used_date
      t.boolean :used

      t.timestamps
    end
    add_index :character_requirements, :requirement_attainment_id
    add_index :character_requirements, :character_id
  end
end
