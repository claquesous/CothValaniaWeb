class Occurrence < ActiveRecord::Base
  before_destroy :unlink_rewards, :unlink_requirements
  default_scope order(:end_time).reverse_order
  scope :success, where(success: true)
  scope :failure, where(success: false)
  scope :optional, where(optional: true)
  scope :mandatory, where("optional =? or optional is null", false)
  attr_accessible :end_time, :remarks, :start_time, :success, :event_attendances_attributes, :obtained_requirements_attributes, :used_requirement_ids, :character_reward_ids, :optional, :bonus_points
  # An event can have many attendees
  has_many :event_attendances, :dependent => :destroy, :inverse_of => :occurrence
  has_many :characters, :through => :event_attendances
  # It can provide many rewards to characters
  has_many :character_rewards
  # It can provide requirements
  has_many :obtained_requirements, :class_name => "CharacterRequirement", :foreign_key => "obtained_occurrence_id", dependent: :destroy
  # It may have requirements
  has_many :used_requirements, :class_name => "CharacterRequirement", :foreign_key => "used_occurrence_id"
  # Most important is that it is an occurrence of Event
  belongs_to :event
  # It was added by a member
  belongs_to :member
  validates_presence_of :event
  accepts_nested_attributes_for :event_attendances, :allow_destroy => true
  accepts_nested_attributes_for :obtained_requirements, :allow_destroy => true
  delegate :to_date, to: :end_time

  def self.points
    sum(:bonus_points).to_i + success.joins(:event).sum(:points).to_i + failure.joins(:event).sum(:failure_points).to_i
  end

  def points
    (bonus_points || 0) + (success ? event.points : (event.failure_points || 0 ))
  end
  
  def self.since(date)
    where("end_time >=?", date)
  end

  private

  def unlink_requirements
    self.used_requirements.each do |ur|
      ur.used_occurrence_id = nil
      ur.save!
    end
  end

  def unlink_rewards
    self.character_rewards.each do |cr|
      cr.occurrence_id = nil
      cr.save!
    end
  end
end
