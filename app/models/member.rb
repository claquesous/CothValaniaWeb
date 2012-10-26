class Member < ActiveRecord::Base
  attr_accessible :active, :name, :password, :remarks, :url
  has_secure_password
  attr_protected :admin, :cycle_date, :reward_cycle, :join_date
  validates_presence_of :name, :password, :on => :create
  has_many :characters
end
