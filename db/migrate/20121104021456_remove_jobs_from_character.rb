class RemoveJobsFromCharacter < ActiveRecord::Migration
  def up
    remove_column :characters, :war
    remove_column :characters, :mnk
    remove_column :characters, :thf
    remove_column :characters, :whm
    remove_column :characters, :blm
    remove_column :characters, :rdm
    remove_column :characters, :pld
    remove_column :characters, :drk
    remove_column :characters, :bst
    remove_column :characters, :brd
    remove_column :characters, :rng
    remove_column :characters, :sam
    remove_column :characters, :nin
    remove_column :characters, :drg
    remove_column :characters, :smn
    remove_column :characters, :blu
    remove_column :characters, :cor
    remove_column :characters, :pup
    remove_column :characters, :dnc
    remove_column :characters, :sch
  end

  def down
    add_column :characters, :sch, :string
    add_column :characters, :dnc, :string
    add_column :characters, :pup, :string
    add_column :characters, :cor, :string
    add_column :characters, :blu, :string
    add_column :characters, :smn, :string
    add_column :characters, :drg, :string
    add_column :characters, :nin, :string
    add_column :characters, :sam, :string
    add_column :characters, :rng, :string
    add_column :characters, :brd, :string
    add_column :characters, :bst, :string
    add_column :characters, :drk, :string
    add_column :characters, :pld, :string
    add_column :characters, :rdm, :string
    add_column :characters, :blm, :string
    add_column :characters, :whm, :string
    add_column :characters, :thf, :string
    add_column :characters, :mnk, :string
    add_column :characters, :war, :string
  end
end
