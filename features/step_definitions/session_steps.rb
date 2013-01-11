Given /^I have an account named "([^\"]+)" with password "([^\"]+)"$/ do |member, pass|
  member = FactoryGirl.create(:member, :name => member, :password => pass)
end

Given /^I am logged in( as .*)?$/ do |role|
  FactoryGirl.create :site_config if SiteConfig.count == 0
  case role
  when " as an admin"
    conditions = {:admin => true}
  when " as the leader"
    conditions = {:leader => true}
  when / as "(.*)"/
    conditions = {:name => $1}
  else
    conditions = {}
  end
  member = FactoryGirl.create(:member, conditions)
  visit '/login'
  fill_in 'Member', :with => member.name
  fill_in 'Password', :with => member.password
  click_button 'Log In'
  page.should have_content "Logged in"
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

