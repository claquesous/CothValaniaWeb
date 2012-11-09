class Member < ActiveRecord::Base
  attr_accessible :active, :name, :password, :password_confirmation, :remarks, :url, :characters_attributes
  has_secure_password
  validates_presence_of :name, :password, :on => :create
  has_many :characters, :inverse_of => :member
  has_many :news
  has_many :shouts
  has_many :event_attendances, :through => :characters
  validates_uniqueness_of :name
  accepts_nested_attributes_for :characters, :reject_if => lambda { |a| a[:name].blank? }

  def name=(s)
    write_attribute(:name, s.to_s.titleize) 
  end

  def points
    event_attendances.collect {|a| a.event_occurrence.event.points }.sum
  end
end
