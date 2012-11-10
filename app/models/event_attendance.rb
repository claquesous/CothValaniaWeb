class EventAttendance < ActiveRecord::Base
  attr_accessible :character_id
  belongs_to :event_occurrence
  belongs_to :character
  has_one :event, :through => :event_occurrence
  validates_presence_of :character, :event_occurrence
  validates_uniqueness_of :character_id, :scope => :event_occurrence_id
end
