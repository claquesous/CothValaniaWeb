class Member < ActiveRecord::Base
  attr_accessible :active, :name, :password, :remarks, :url
  attr_protected :admin, :cycle_date, :reward_cycle, :join_date
  validates_presence_of :name, :password
  has_many :characters
end
