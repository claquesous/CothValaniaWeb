class EventAttendance < ActiveRecord::Base
  scope :order_by_date, joins(:occurrence).order("occurrences.end_time desc")
  attr_accessible :character_id, :character_job_id
  belongs_to :occurrence
  belongs_to :character
  belongs_to :character_job
  has_one :event, :through => :occurrence
  has_one :member, through: :character
  validates_presence_of :character, :occurrence
  validates_uniqueness_of :character_id, :scope => :occurrence_id
  before_destroy :reset_points
  after_create :set_points

  def self.points
    includes(:occurrence).merge(Occurrence.success).joins(:event).sum(:points).to_i + 
      includes(:occurrence).merge(Occurrence.failure).joins(:event).sum(:points).to_i
  end

  def self.since(date)
    includes(:occurrence).merge(Occurrence.since(date))
  end

  private

  def reset_points
    character.destroy_occurrence(occurrence)
  end

  def set_points
    character.add_occurrence(occurrence)
  end
end
