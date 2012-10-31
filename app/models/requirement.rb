class Requirement < ActiveRecord::Base
  attr_accessible :name, :reusable
  has_many :requirement_obtainments
  has_many :event_requirements
  validates_uniqueness_of :name

  def name=(s)
    write_attribute(:name, s.to_s.titleize) 
  end
end
