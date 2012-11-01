class Member < ActiveRecord::Base
  attr_accessible :active, :name, :password, :password_confirmation, :remarks, :url
  has_secure_password
  validates_presence_of :name, :password, :on => :create
  has_many :characters
  has_many :news
  has_many :shouts
  has_many :event_attendances, :through => :characters
  validates_uniqueness_of :name

  def name=(s)
    write_attribute(:name, s.to_s.titleize) 
  end

  def points
    event_attendances.collect {|a| a.event_occurrence.event.points }.sum
  end
end
