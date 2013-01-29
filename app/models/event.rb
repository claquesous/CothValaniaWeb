class Event < ActiveRecord::Base
  scope :visible, where{(hidden == false) | (hidden == nil)}
  default_scope order(:name)
  attr_accessible :hidden, :name, :points, :failure_points, :remarks, :time
  validates_presence_of :name, :points
  has_many :event_rewards, dependent: :destroy
  has_many :rewards, :through => :event_rewards
  has_many :occurrences, dependent: :destroy
  has_many :event_requirements, dependent: :destroy
  has_many :requirement_obtainments, dependent: :destroy
  validates_uniqueness_of :name
end
