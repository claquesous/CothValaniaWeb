class Member < ActiveRecord::Base
  attr_accessible :active, :admin, :cycle_date, :join_date, :name, :password, :remarks, :reward_cycle, :url
  has_many :characters
end
