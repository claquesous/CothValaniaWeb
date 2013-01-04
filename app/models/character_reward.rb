class CharacterReward < ActiveRecord::Base
  before_save :set_obtained, :set_obtained_points
  scope :unobtained, where("obtained=? or obtained is null", false)
  scope :obtained, where(obtained: true)
  scope :active, joins(:member).where("members.active")
  belongs_to :member
  belongs_to :character
  belongs_to :reward
  belongs_to :occurrence
  attr_accessible :preference, :remarks, :reward_cycle, :reward_id, :character_id
  validates_uniqueness_of :preference, :scope => [:member_id, :reward_cycle], :allow_nil => true
  validates_uniqueness_of :reward_id, scope: :member_id
  validates_presence_of :member, :character, :reward

  def self.unobtained_or_occurrence(occurrence)
    active.unobtained | obtained.where(occurrence_id: occurrence.id)
  end

  def self.obtained_from(event)
    obtained.joins(:occurrence).where("occurrences.event_id =?", event.id)
  end

  def current_points
    member.current_points.to_f/preference
  end

  private
  def set_obtained
    self.obtained = !self.occurrence_id.nil?
    true
  end

  def set_obtained_points
    self.obtained_points = current_points if preference
    true
  end
end
