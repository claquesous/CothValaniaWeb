class Reward < ActiveRecord::Base
  default_scope order(:name)
  attr_accessible :external_value, :name, :remarks, :event_rewards_attributes
  validates_presence_of :name
  has_many :event_rewards, :inverse_of => :reward, dependent: :destroy
  has_many :events, :through => :event_rewards
  has_many :character_rewards, dependent: :destroy
  validates_uniqueness_of :name
  validates :name, uri_eligibility: true
  accepts_nested_attributes_for :event_rewards, :allow_destroy => true
end
