class EventReward < ActiveRecord::Base
  # attr_accessible :title, :body
  belongs_to :event, :reward
end
