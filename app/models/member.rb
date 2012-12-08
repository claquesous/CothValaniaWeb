class Member < ActiveRecord::Base
  scope :active, where("active=? or active is null", true)
  scope :inactive, where("active=?", false)
  scope :admins, where("admin=? or leader=?", true, true)
  default_scope order(:name)
  attr_accessible :active, :name, :password, :password_confirmation, :remarks, :url, :characters_attributes
  has_secure_password
  validates_presence_of :name, :password, :on => :create
  has_many :characters, :inverse_of => :member
  has_many :news
  has_many :shouts
  has_many :event_attendances, :through => :characters
  has_many :character_rewards
  has_many :occurrences
  validates_uniqueness_of :name
  validates_uniqueness_of :leader, allow_nil: true
  accepts_nested_attributes_for :characters, :reject_if => lambda { |a| a[:name].blank? }

  def self.leader
    where(leader: true).first
  end

  def points
    event_attendances.points
  end
  
  def current_points
    event_attendances.since(cycle_date).points
  end

  def selected_rewards
    character_rewards.unobtained.collect(&:reward)
  end

  def available_rewards
     Reward.all - character_rewards.collect(&:reward)
  end

  def build_rewards(rewards)
    character_rewards.unobtained.destroy_all
    preferences = character_rewards.obtained.pluck(:preference)
    preference = 1
    rewards.each do |rid|
      preference +=1 while preferences.include?(preference)
      character_rewards.build(:preference => preference, :reward => Reward.find(rid))
      preferences << preference
    end
  end

  def build_all_character_jobs
    characters.each do |character|
      character.build_all_character_jobs(Job.all)
    end
  end
end
