class Character < ActiveRecord::Base
  attr_accessible :blm, :blu, :brd, :bst, :cor, :dnc, :drg, :drk, :mnk, :name, :nin, :pld, :pup, :rdm, :remarks, :rng, :sam, :sch, :smn, :thf, :war, :whm
  belongs_to :member
  validates_presence_of :name, :member
  has_many :character_requirements
  has_many :character_rewards
  has_many :news
  has_many :shouts
  has_many :event_attendances
end
