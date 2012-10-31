class Reward < ActiveRecord::Base
  attr_accessible :external_value, :name, :remarks
  validates_presence_of :name
  has_many :event_rewards
  has_many :character_rewards
  validates_uniqueness_of :name

  def name=(s)
    write_attribute(:name, s.to_s.titleize)
  end
end
