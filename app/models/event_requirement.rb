class EventRequirement < ActiveRecord::Base
  attr_accessible :event_id
  belongs_to :requirement
  belongs_to :event
end
