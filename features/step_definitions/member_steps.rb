Given /^I have a member named "(.*?)"$/ do |member|
  FactoryGirl.create(:member, name: member)
end

Then /^I should see "(.*?)" has (\d+) points$/ do |member, points|
  page.find_by_id(member).text.should include(points)
end

Given /^Member "(.*?)" has (\d+) points$/ do |member, points|
  step(%Q{I have a member named "#{member}"})
  step(%Q{There is an event named "#{member}" which is worth #{points} points})
  step(%Q{"#{member}" has a character named "#{member}"})
  step(%Q{"#{member}" attended "#{member}"})
end

