class Character < ActiveRecord::Base
  attr_accessible :blm, :blu, :brd, :bst, :cor, :dnc, :drg, :drk, :mnk, :name, :nin, :pld, :pup, :rdm, :remarks, :rng, :sam, :sch, :smn, :thf, :war, :whm
  belongs_to :member
end
