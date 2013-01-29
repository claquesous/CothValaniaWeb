Given /^I have a? ?members? named "(.*?)"$/ do |members|
  members.split("\", \"").each do |member|
    FactoryGirl.create(:member, name: member)
  end
end

Then /^I should see "(.*?)" has (\d+) points$/ do |member, points|
  page.find_by_id(member).text.should include(points)
end

Given /^Member "(.*?)" has (\d+) points$/ do |member, points|
  member = FactoryGirl.create(:member, name: member)
  member.total_points = points
  member.current_points = points
  member.characters.first.total_points = points
  member.characters.first.current_points = points
  member.save!
end

Given /^"(.*?)" is (in)?active$/ do |member, inactive|
  member = Member.find_by_name(member)
  member.active = !inactive
  member.save!
end

Given /^"(.*?)" is (not )?an admin$/ do |member,notadmin|
  member = Member.find_by_name(member)
  member.admin = !notadmin
  member.save!
end

