class EventOccurrence < ActiveRecord::Base
  attr_accessible :end_time, :remarks, :start_time, :success
  # An event can have many attendees
  has_many :event_attendances
  # It can provide many rewards to characters
  has_many :character_rewards
  # It can provide requirements
  has_many :requirement_obtainments
  # It may have requirements
  has_many :event_requirements
  belongs_to :event
end
