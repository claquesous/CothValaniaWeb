class Job < ActiveRecord::Base
  attr_accessible :name, :short_name, :remarks
  has_many :character_jobs
  validates_uniqueness_of :name

  def name=(s)
    write_attribute(:name, s.to_s.titleize)
  end
end
