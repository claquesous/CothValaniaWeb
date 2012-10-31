class Event < ActiveRecord::Base
  attr_accessible :hidden, :name, :points, :remarks, :time
  validates_presence_of :name, :points
  has_many :event_rewards
  has_many :event_occurrences
  has_many :event_requirements
  has_many :requirement_obtainments
  validates_uniqueness_of :name

  def name=(s)
    write_attribute(:name, s.to_s.titleize) 
  end 
end
