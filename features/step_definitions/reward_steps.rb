Given /^There are rewards named: "(.*)"$/ do |rewards|
  rewards.split("\", \"").each do |reward|
    FactoryGirl.create(:reward, name: reward)
  end
end

Given /^I am on the rewards page for "(.*?)"$/ do |reward|
  visit reward_path(Reward.find_by_name(reward))
end

