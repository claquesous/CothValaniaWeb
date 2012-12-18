Given /^"(.*?)" listed "(.*?)" as their #(\d+) preference$/ do |member, reward, preference|
  member = Member.find_by_name(member)
  reward = Reward.find_by_name(reward)
  member.character_rewards.create!(:character_id => member.characters.first.id, :preference => preference, :reward_id => reward.id)
end

Then /^I should see a tie between "([^\"]*)" and "([^\"]*)"$/ do |mem1, mem2|
  body = page.text
  if body.match("#{mem1} (\d*).*#{mem2} (\d*)") || body.match("#{mem2} (\d*).*#{mem1} (\d*)")
    $1.should eq($2)
  else
    fail
  end
end

Then /^I select "(.*?)"( for "(.*?)")? as my \#(\d+) preference$/ do |reward, character_exists, character, preference|
  preference_index = preference.to_i - 1
  select reward, from: "member_character_rewards_attributes_#{preference_index}_reward_id"
  select character, from: "member_character_rewards_attributes_#{preference_index}_character_id" if character_exists
end

