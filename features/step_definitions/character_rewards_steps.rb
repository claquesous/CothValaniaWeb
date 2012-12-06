Given /^"(.*?)" listed "(.*?)" as their #(\d+) preference$/ do |member, reward, preference|
  member = Member.find_by_name(member)
  reward = Reward.find_by_name(reward)
  member.character_rewards.create!(:character => member.characters.first, :preference => preference, :reward => reward)
end

Then /^I should see a tie between "([^\"]*)" and "([^\"]*)"$/ do |mem1, mem2|
  body = page.text
  if body.match("#{mem1} (\d*).*#{mem2} (\d*)") || body.match("#{mem2} (\d*).*#{mem1} (\d*)")
    $1.should eq($2)
  else
    fail
  end
end

