class Member < ActiveRecord::Base
  attr_accessible :active, :name, :password, :password_confirmation, :remarks, :url
  has_secure_password
  attr_protected :admin, :cycle_date, :reward_cycle, :join_date
  validates_presence_of :name, :password
  has_many :characters
end
