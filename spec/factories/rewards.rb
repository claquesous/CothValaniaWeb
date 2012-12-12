# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :reward do
    sequence(:name) { |n| "Reward%03d" % n }
  end
end
