class EventReward < ActiveRecord::Base
  belongs_to :event
  belongs_to :reward
  validates_presence_of :event, :reward
  attr_accessible :event_id
end
