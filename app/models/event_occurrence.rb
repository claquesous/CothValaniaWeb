class EventOccurrence < ActiveRecord::Base
  attr_accessible :end_time, :remarks, :start_time, :success
  has_many :event_attendances
  belongs_to :event
end
