Given /^"(.*?)" attended "(.*?)"( (\d)+ days ago)?$/ do |character, event, occurred, days|
  end_time = occurred ? days.to_i.days.ago : Time.now
  o = FactoryGirl.build(:occurrence, end_time: end_time)
  o.event = Event.find_by_name(event)
  o.save!
  ea = EventAttendance.new
  ea.occurrence = o
  ea.character = Character.find_by_name(character)
  ea.save!
end

When /^"(.*?)" no longer attended "(.*?)" (\d+) days ago$/ do |character, event, days|
  c = Character.find_by_name(character)
  ea = c.event_attendances.includes(:occurrence => (:event)).where("events.name = ? and date(end_time)=?", event, days.to_i.days.ago)
  ea.first.destroy
end

