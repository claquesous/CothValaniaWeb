Given /^"(.*?)" has a character named "(.*?)"$/ do |mem, char|
  Member.find_by_name(mem).characters.create(name: char)
end

