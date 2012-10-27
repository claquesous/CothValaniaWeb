class Reward < ActiveRecord::Base
  attr_accessible :external_value, :name, :remarks
  validates_presence_of :name
  has_many :event_rewards
  has_many :character_rewards
end
