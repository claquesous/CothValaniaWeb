class EventReward < ActiveRecord::Base
  belongs_to :event
  belongs_to :reward
  validates_presence_of :event, :reward
  attr_accessible :event_id
  scope :visible, joins(:event).where("events.hidden=? or events.hidden is null", false)

  def drop_rate
    reward.character_rewards.obtained_from(event).count.to_f / event.occurrences.count
  end
end
