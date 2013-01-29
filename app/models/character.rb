class Character < ActiveRecord::Base
  attr_accessible :name, :remarks, :sex, :race_id, :character_jobs_attributes
  belongs_to :member
  validates_presence_of :name, :member
  has_many :character_requirements, dependent: :destroy
  has_many :character_rewards, dependent: :destroy
  has_many :event_attendances, dependent: :destroy
  has_many :attendances, source: :occurrence, through: :event_attendances
  has_many :character_jobs, :inverse_of => :character, dependent: :destroy
  has_many :jobs, :through => :character_jobs
  validates_uniqueness_of :name
  belongs_to :race
  accepts_nested_attributes_for :character_jobs, :reject_if => :all_blank, :allow_destroy => true

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

  def add_occurrence(occurrence)
    points = occurrence.points
    self.total_points += points
    member.total_points += points
    if (member.current_occurrence? occurrence)
      self.current_points += points
      member.current_points += points
    end
    member.save!
    save!
  end

  def destroy_occurrence(occurrence)
    points = occurrence.points
    self.total_points -= points
    member.total_points -= points
    if (member.current_occurrence? occurrence)
      self.current_points -= points
      member.current_points -= points
    end
    member.save!
    save!
  end
end
