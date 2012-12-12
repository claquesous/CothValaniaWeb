# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :shout do
    date {Time.now}
    sequence(:text) { |n| "Shout text %03d" % n }
    member 
  end
end
