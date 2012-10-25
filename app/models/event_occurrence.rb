class EventOccurrence < ActiveRecord::Base
  attr_accessible :end_time, :remarks, :start_time, :success
end
