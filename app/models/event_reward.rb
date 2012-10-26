class EventReward < ActiveRecord::Base
  # attr_accessible :title, :body
  belongs_to :event
  belongs_to :reward
  validates_associated :event, :reward
end
