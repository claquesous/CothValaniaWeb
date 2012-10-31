# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :member do
    sequence(:name) { |n| "Member#{n}" }
    password "Password"
  end
end
