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
  select reward, from: "member_character_rewards_attributes_#{preference}_reward_id"
  select character, from: "member_character_rewards_attributes_#{preference}_character_id" if character_exists
end

Given /^"(.*?)" has received their ([\d,]+) picks( on (.*))?$/ do |member,picks, date_exists, date|
  member = Member.find_by_name(member)
  date ||= Time.now
  picks.split(",").each do |pick|
    occurrence = FactoryGirl.create :occurrence, end_time: date
    reward = FactoryGirl.create :reward
    member.character_rewards.create!({occurrence: occurrence, preference: pick, character: member.characters.first, reward: reward}, without_protection: true)
  end
end

Then /^I should (not )?be able to set a \#(\d+) preference$/ do |negative,preference|
  eval "page.should#{'_not' if negative} have_selector(\"#member_character_rewards_attributes_#{preference}_preference\")"
end

