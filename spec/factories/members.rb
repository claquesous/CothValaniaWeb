# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :member do
    sequence(:name) { |n| "Member%03d" % n }
    password "Password"
    cycle_date {1.year.ago}
    active true
    characters {[FactoryGirl.build(:character, name: name)]} 
  end
end
