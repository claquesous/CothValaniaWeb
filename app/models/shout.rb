class Shout < ActiveRecord::Base
  default_scope order("id desc")
  belongs_to :member
  attr_accessible :date, :text
  validates_presence_of :text, :member
  before_create :set_date

  private
  def set_date
    self.date = Time.now
  end
end
