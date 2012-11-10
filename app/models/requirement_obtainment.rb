class RequirementObtainment < ActiveRecord::Base
  attr_accessible :event_id
  belongs_to :event
  belongs_to :requirement
end
