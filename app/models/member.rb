class Member < ActiveRecord::Base
  scope :active, where{(active == true) | (active == nil)}
  scope :inactive, where(active: false)
  scope :admins, where{(admin == true) | (leader == true)}
  default_scope order(:name)
  attr_accessible :active, :name, :password, :password_confirmation, :remarks, :url, :characters_attributes, :character_rewards_attributes
  has_secure_password
  validates_presence_of :name, :password, :on => :create
  has_many :characters, :inverse_of => :member, dependent: :destroy
  has_many :news, dependent: :destroy
  has_many :shouts, dependent: :destroy
  has_many :event_attendances, :through => :characters
  has_many :jobs, :through => :characters
  has_many :attendances, source: :occurrence, through: :event_attendances
  has_many :character_rewards, dependent: :destroy
  has_many :occurrences
  validates_uniqueness_of :name
  validates_uniqueness_of :leader, allow_nil: true
  accepts_nested_attributes_for :characters, :reject_if => lambda { |a| a[:name].blank? }
  validate :has_character?
  accepts_nested_attributes_for :character_rewards
  before_validation :destroy_unset_character_rewards
  before_create :set_dates

  def self.leader
    where(leader: true).first
  end

  def attendance_rate(since_date = join_date)
    100 * (attendances.since(since_date).mandatory.points.to_f / Occurrence.since(since_date).mandatory.points)
  end

  def attendance_percentage
     100 * (total_points.to_f / EventAttendance.points)
  end
  
  def available_rewards
     Reward.all - character_rewards.includes(:reward).obtained.collect(&:reward)
  end

  def wishlist_length
    character_rewards.obtained.by_cycle(reward_cycle).count + available_rewards.count
  end

  def build_all_character_jobs
    characters.each do |character|
      character.build_all_character_jobs(Job.all)
    end
  end

  def begin_new_cycle
    self.reward_cycle += 1
    self.cycle_date = get_last_reward_date
    self.current_points = 0
    characters.each do |character|
      character.current_points = 0
      character.save!
    end
    save!
  end

  def current_occurrence?(occurrence)
    cycle_date <= occurrence.to_date
  end

  private
  def get_last_reward_date
    character_rewards.obtained.where{preference.not_eq nil}.joins(:occurrence).maximum("occurrences.end_time")
  end

  def has_character?
    errors.add :base, "Member must have at least one character" if characters.blank?
  end

  def destroy_unset_character_rewards
    character_rewards.each do |cr|
      cr.mark_for_destruction if cr.reward_id.blank?
    end
  end

  def set_dates
    self.join_date ||= Time.now
    self.cycle_date ||= Time.now
  end
end
