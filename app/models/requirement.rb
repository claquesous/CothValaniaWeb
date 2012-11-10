class Requirement < ActiveRecord::Base
  attr_accessible :name, :reusable, :multiple, :requirement_obtainments_attributes, :event_requirements_attributes
  has_many :requirement_obtainments
  accepts_nested_attributes_for :requirement_obtainments, :allow_destroy => true
  has_many :event_requirements
  accepts_nested_attributes_for :event_requirements, :allow_destroy => true
  validates_uniqueness_of :name

  def name=(s)
    write_attribute(:name, s.to_s.titleize) 
  end
end
