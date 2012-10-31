# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :event do
    sequence(:name) { |n| "Event#{n}" }
    points { rand(3) }
  end
end
