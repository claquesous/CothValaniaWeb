When /^I click "(.*)"$/ do |link_or_button|
    click_on link_or_button
end

Given /^I am on the "(.*)" page$/ do |page|
  visit "/#{page.downcase}"
end

Given /^I am on the home page$/ do
  visit '/'
end

Given /^I am on the login page$/ do
  visit '/login'
end

Then /^I should (not )?see "([^\"]+)"$/ do |n,message|
  eval %Q{page.should#{"_not" unless n.nil?} have_content(message)}
end

Then /^I should be on the root page$/ do
  current_path.should == "/"
end

Then /^I should be on the "Login" page$/ do
  current_path.should == login_path
end

Then /^I should see an? "([^\"]+)" link$/ do |l|
  page.should have_link(l)
end

Then /^I should see "(.*?)" before "(.*?)"$/ do |arg1, arg2|
  page.body.gsub("\n","").should match("#{arg1}.*#{arg2}")
end

Then /^I should (not )?see "(.*?)" within "(.*?)"$/ do |n,arg1, section|
  begin
    within("##{section}") do
      eval %Q{page.should#{"_not" unless n.nil?} have_text(arg1)}
    end
  rescue
    !n.nil?
  end
end

When /^I (un)?check the box next to "(.*?)"$/ do |uncheck, arg1|
  all('tr', text: arg1 ).each do |row|
    row.find("input[type='checkbox']").set(uncheck.nil?)
  end
end

When /^I fill in "(.*?)" with "(.*?)"$/ do |field, value|
  page.all(:field, field).each do |form_field|
    form_field.set value
  end
end

When /^I choose "(.*)"$/ do |radio|
  choose radio
end

