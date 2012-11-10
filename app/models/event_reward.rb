class EventReward < ActiveRecord::Base
  belongs_to :event
  belongs_to :reward
  validates_associated :event, :reward
  attr_accessible :event_id
end
