class EventAttendance < ActiveRecord::Base
  belongs_to :event_occurrence
  belongs_to :character
end
