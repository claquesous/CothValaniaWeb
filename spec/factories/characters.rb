# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :character do
    sequence(:name) { |n| "Character%03d" % n }
    member
  end
end
