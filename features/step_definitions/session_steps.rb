Given /^I have an account named "([^\"]+)" with password "([^\"]+)"$/ do |member, pass|
  member = FactoryGirl.create(:member, :name => member, :password => pass)
end

Given /^I am logged in$/ do
  member = FactoryGirl.create(:member)
  post login_url, :member => member.name, :password => member.password
end

When /^I login with invalid credentials$/ do
  Member.delete_all
  fill_in 'Member', :with => 'Member'
  fill_in 'Password', :with => 'Password'
  click_button 'Log In'
end

When /^I login with "([^\"]+)" and "([^\"]+)"$/ do |member, password|
  fill_in 'Member', :with => member
  fill_in 'Password', :with => password
  click_button 'Log In'
end

