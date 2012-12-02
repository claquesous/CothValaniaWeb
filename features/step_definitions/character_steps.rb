Given /^"(.*?)" has a? ?characters? named "(.*?)"$/ do |mem, chars|
  chars.split("\", \"").each do |char|
    Member.find_by_name(mem).characters.create(name: char)
  end
end

Then /^I should be able to add characters: "(.*?)"$/ do |characters|
  
  first = true
  characters.split("\", \"").each do |character|
    click_on("Add Character") unless first
    first = false
    #puts find("Name").count
    fill_in "member_characters_attributes_0_nam", :with => character
  end
  click_on "Save"
  characters.split("\", \"").each do |character|
    page.should have_content(character)  
  end
end

