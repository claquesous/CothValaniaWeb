class Event < ActiveRecord::Base
  attr_accessible :hidden, :name, :points, :remarks, :time
  validates_presence_of :name, :points
  has_many :event_rewards
  has_many :event_occurrences
  has_many :event_requirements
  has_many :requirement_obtainments
end
