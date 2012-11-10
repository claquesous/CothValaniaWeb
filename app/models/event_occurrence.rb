class EventOccurrence < ActiveRecord::Base
  attr_accessible :end_time, :remarks, :start_time, :success
  # An event can have many attendees
  has_many :event_attendances, :dependent => :destroy
  # It can provide many rewards to characters
  has_many :character_rewards
  # It can provide requirements
  has_many :character_requirements, :foreign_key => "obtained_event_occurrence_id"
  # It may have requirements
  has_many :character_requirements, :foreign_key => "used_event_occurrence_id"
  # Most important is that it is an occurrence of Event
  belongs_to :event
  validates_presence_of :event
end
