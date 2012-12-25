class News < ActiveRecord::Base
  belongs_to :member
  attr_accessible :date, :text
  before_create :set_date

  private
  def set_date
    self.date = Time.now
  end
end
