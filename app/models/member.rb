class Member < ActiveRecord::Base
  scope :active, where("active=? or active is null", true)
  scope :inactive, where("active=?", false)
  scope :admins, where("admin=? or leader=?", true, true)
  default_scope order(:name)
  attr_accessible :active, :name, :password, :password_confirmation, :remarks, :url, :characters_attributes, :character_rewards_attributes
  has_secure_password
  validates_presence_of :name, :password, :on => :create
  has_many :characters, :inverse_of => :member
  has_many :news
  has_many :shouts
  has_many :event_attendances, :through => :characters
  has_many :attendances, source: :occurrence, through: :event_attendances
  has_many :character_rewards
  has_many :occurrences
  validates_uniqueness_of :name
  validates_uniqueness_of :leader, allow_nil: true
  accepts_nested_attributes_for :characters, :reject_if => lambda { |a| a[:name].blank? }
  validate :has_character?
  accepts_nested_attributes_for :character_rewards
  before_validation :destroy_unset_character_rewards

  def self.leader
    where(leader: true).first
  end

  def points
    attendances.points
  end
  
  def current_points
    attendances.since(cycle_date).points
  end

  def attendance_rate(since_date = join_date)
    100 * (attendances.since(since_date).mandatory.points.to_f / Occurrence.since(since_date).mandatory.points)
  end

  def attendance_percentage
     100 * (points.to_f / EventAttendance.points)
  end
  
  def available_rewards
     Reward.all - character_rewards.obtained.collect(&:reward)
  end

  def build_all_character_jobs
    characters.each do |character|
      character.build_all_character_jobs(Job.all)
    end
  end

  private
  def has_character?
    errors.add :base, "Member must have at least one character" if characters.blank?
  end

  def destroy_unset_character_rewards
    character_rewards.each do |cr|
      cr.mark_for_destruction if cr.reward_id.blank?
    end
  end
end
