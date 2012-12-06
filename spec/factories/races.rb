# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :race do
    sequence(:name) { |n| "Race#{n}" }
  end
end
