class Member < ActiveRecord::Base
  attr_accessible :active, :name, :password, :remarks, :url
  has_secure_password
  validates_presence_of :name, :password, :on => :create
  has_many :characters
  has_many :news
  has_many :shouts
end
