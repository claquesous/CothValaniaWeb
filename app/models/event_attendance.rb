class EventAttendance < ActiveRecord::Base
  belongs_to :event_occurrence
  belongs_to :character
  has_one :event, :through => :event_occurrence
end
