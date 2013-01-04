Given /^I am on the new occurrence page for "(.*?)"$/ do |event|
  visit new_event_occurrence_path(Event.find_by_name(event))
end

Given /^There have been (\d+) occurrences of "(.*?)"$/ do |count, event|
  count.to_i.times do 
    FactoryGirl.create(:occurrence, event: Event.find_by_name(event))
  end
end

Given /^There was an occurrence of "(.*?)" which dropped "(.*?)"$/ do |event, reward|
  member = FactoryGirl.create(:member)
  occurrence = FactoryGirl.create(:occurrence, event: Event.find_by_name(event))
  cr = occurrence.character_rewards.build(reward_id: Reward.find_by_name(reward).id)
  cr.member = member
  cr.character =  member.characters.first
  cr.save!
end
