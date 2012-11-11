class Occurrence < ActiveRecord::Base
  attr_accessible :end_time, :remarks, :start_time, :success, :event_attendances_attributes
  # An event can have many attendees
  has_many :event_attendances, :dependent => :destroy, :inverse_of => :occurrence
  # It can provide many rewards to characters
  has_many :character_rewards
  # It can provide requirements
  has_many :character_requirements, :foreign_key => "obtained_occurrence_id"
  # It may have requirements
  has_many :character_requirements, :foreign_key => "used_occurrence_id"
  # Most important is that it is an occurrence of Event
  belongs_to :event
  validates_presence_of :event
  accepts_nested_attributes_for :event_attendances, :allow_destroy => true
end
