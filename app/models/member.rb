class Member < ActiveRecord::Base
  attr_accessible :active, :name, :password, :password_confirmation, :remarks, :url, :characters_attributes
  has_secure_password
  validates_presence_of :name, :password, :on => :create
  has_many :characters, :inverse_of => :member
  has_many :news
  has_many :shouts
  has_many :event_attendances, :through => :characters
  has_many :character_rewards
  validates_uniqueness_of :name
  accepts_nested_attributes_for :characters, :reject_if => lambda { |a| a[:name].blank? }

  def name=(s)
    write_attribute(:name, s.to_s.titleize) 
  end

  def points
    event_attendances.collect {|a| a.occurrence.event.points }.sum
  end

  def selected_rewards
    character_rewards.where("occurrence_id is null").collect {|cr| cr.reward}
  end

  def available_rewards
    if character_rewards.empty?
      Reward.all
    else
      Reward.where("id not in (?)", character_rewards.collect {|cr| cr.reward})
    end
  end

  def build_rewards(rewards)
    preference = 1
    character_rewards.where("occurrence_id is null").destroy_all
    preferences = character_rewards.where("occurrence_id is not null").pluck(:preference)
    rewards.each do |rid|
      preference +=1 while preferences.include?(preference)
      character_rewards.build(:preference => preference, :reward => Reward.find(rid))
      preferences << preference
    end
  end
end
