class EventRequirement < ActiveRecord::Base
  belongs_to :requirement
  belongs_to :event
end
