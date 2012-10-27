class EventReward < ActiveRecord::Base
  belongs_to :event
  belongs_to :reward
  validates_associated :event, :reward
end
