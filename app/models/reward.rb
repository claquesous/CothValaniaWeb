class Reward < ActiveRecord::Base
  attr_accessible :external_value, :name, :remarks
  validates_existence_of :name
  has_many :event_rewards
end
