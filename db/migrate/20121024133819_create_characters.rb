class CreateCharacters < ActiveRecord::Migration
  def change
    create_table :characters do |t|
      t.string :name
      t.string :remarks
      t.boolean :war
      t.boolean :mnk
      t.boolean :thf
      t.boolean :whm
      t.boolean :blm
      t.boolean :rdm
      t.boolean :pld
      t.boolean :drk
      t.boolean :bst
      t.boolean :brd
      t.boolean :rng
      t.boolean :sam
      t.boolean :nin
      t.boolean :drg
      t.boolean :smn
      t.boolean :blu
      t.boolean :cor
      t.boolean :pup
      t.boolean :dnc
      t.boolean :sch
      t.references :member

      t.timestamps
    end
  end
end
