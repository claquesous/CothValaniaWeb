class Character < ActiveRecord::Base
  attr_accessible :blm, :blu, :brd, :bst, :cor, :dnc, :drg, :drk, :mnk, :name, :nin, :pld, :pup, :rdm, :remarks, :rng, :sam, :sch, :smn, :thf, :war, :whm, :sex
  belongs_to :member
  validates_presence_of :name, :member
  has_many :character_requirements
  has_many :character_rewards
  has_many :event_attendances
  validates_uniqueness_of :name
  belongs_to :race

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
end
