class Job < ActiveRecord::Base
  attr_accessible :name, :short_name, :remarks
  has_many :character_jobs, dependent: :destroy
  validates_uniqueness_of :name
  validates_presence_of :name
  validates :name, uri_eligibility: true
end
