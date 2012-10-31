class Character < ActiveRecord::Base
  attr_accessible :blm, :blu, :brd, :bst, :cor, :dnc, :drg, :drk, :mnk, :name, :nin, :pld, :pup, :rdm, :remarks, :rng, :sam, :sch, :smn, :thf, :war, :whm
  belongs_to :member
  validates_presence_of :name, :member
  has_many :character_requirements
  has_many :character_rewards
  has_many :event_attendances
  validates_uniqueness_of :name

  def name=(s)
    write_attribute(:name, s.to_s.titleize) 
  end 
end
