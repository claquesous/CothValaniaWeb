class EventAttendance < ActiveRecord::Base
  scope :order_by_date, joins(:occurrence).order("occurrences.end_time desc")
  attr_accessible :character_id
  belongs_to :occurrence
  belongs_to :character
  has_one :event, :through => :occurrence
  validates_presence_of :character, :occurrence
  validates_uniqueness_of :character_id, :scope => :occurrence_id

  def self.points
    includes(:occurrence).merge(Occurrence.success).joins(:event).sum(:points).to_i + 
      includes(:occurrence).merge(Occurrence.failure).joins(:event).sum(:points).to_i
  end

  def self.since(date)
    includes(:occurrence).merge(Occurrence.since(date))
  end
end
