Given /^There are rewards named: (".*")$/ do |rewards|
  rewards.split(", ").each do |reward|
    FactoryGirl.create(:reward, name: reward)
  end
end

