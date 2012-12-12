class Event < ActiveRecord::Base
  scope :visible, where("hidden=? or hidden is null", false)
  default_scope order(:name)
  attr_accessible :hidden, :name, :points, :failure_points, :remarks, :time
  validates_presence_of :name, :points
  has_many :event_rewards
  has_many :rewards, :through => :event_rewards
  has_many :occurrences
  has_many :event_requirements
  has_many :requirement_obtainments
  validates_uniqueness_of :name
end
