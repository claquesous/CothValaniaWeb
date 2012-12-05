Given /^There are rewards named: "(.*)"$/ do |rewards|
  rewards.split("\", \"").each do |reward|
    FactoryGirl.create(:reward, name: reward)
  end
end

Given /^I am on the rewards page for "(.*?)"$/ do |reward|
  visit reward_path(Reward.find_by_name(reward))
end

Given /^"(.*?)" has reward "(.*?)"$/ do |event, reward|
  visit '/rewards/new'
  check event
  fill_in "Name", :with => reward
  click_on "Save"
  page.should have_content("Reward was successfully created.")
end

When /^I (un)?check "(.*?)" as obtained by "(.*?)"$/ do |uncheck,reward, char|
  cr = CharacterReward.where("reward_id =? and character_id=?", Reward.find_by_name(reward), Character.find_by_name(char)).first
  eval("#{uncheck}check 'character_rewards_#{cr.id}'")
end

