class Character < ActiveRecord::Base
  attr_accessible :name, :remarks, :sex, :race_id, :character_jobs_attributes
  belongs_to :member
  validates_presence_of :name, :member
  has_many :character_requirements
  has_many :character_rewards
  has_many :event_attendances
  has_many :character_jobs, :inverse_of => :character
  has_many :jobs, :through => :character_jobs
  validates_uniqueness_of :name
  belongs_to :race
  accepts_nested_attributes_for :character_jobs, :reject_if => :all_blank, :allow_destroy => true

  def name=(s)
    write_attribute(:name, s.to_s.titleize) 
  end 

  def sex
    case read_attribute(:sex)
    when 1
      "Male"
    when 2
      "Female"
    else
      ""
    end
  end

  def sex=(sex)
    case sex
    when "Male"
      write_attribute(:sex, 1)
    when "Female"
      write_attribute(:sex, 2)
    else
      write_attribute(:sex, 0)
    end
  end

  def points
    event_attendances.collect {|a| a.event_occurrence.event.points }.sum
  end
end
