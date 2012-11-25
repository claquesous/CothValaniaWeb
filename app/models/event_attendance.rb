class EventAttendance < ActiveRecord::Base
  scope :order_by_date, joins(:occurrence).order("occurrences.end_time")
  attr_accessible :character_id
  belongs_to :occurrence
  belongs_to :character
  has_one :event, :through => :occurrence
  validates_presence_of :character, :occurrence
  validates_uniqueness_of :character_id, :scope => :occurrence_id
end
