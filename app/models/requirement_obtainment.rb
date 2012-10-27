class RequirementObtainment < ActiveRecord::Base
  belongs_to :event
  belongs_to :requirement
  # attr_accessible :title, :body
end
