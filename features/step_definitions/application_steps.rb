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
  page.text.should match("#{arg1}.*#{arg2}")
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

When /^I check "([^\"]+)"$/ do |check|
  check check
end

When /^I select "([^\"]+)"$/ do |select|
  select select
end

Then /^I should (not )?see a check in the "(.*?)" column for "(.*?)"$/ do |negative, column_name, row|
  page.all('table').each do |table|
    column = nil
    table.all('th').each_with_index do |header,i|
      begin
        header.should have_content(column_name)
        column = i
      rescue
      end
    end
    if column
      cell = table.find('tr', text: row).all('td')[column]
      eval %Q{cell.should#{"_not" if negative} have_css('i.icon-ok')}
    end
  end
end

