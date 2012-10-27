class Requirement < ActiveRecord::Base
  attr_accessible :name, :reusable
  has_many :requirement_obtainments
  has_many :event_requirements
end
