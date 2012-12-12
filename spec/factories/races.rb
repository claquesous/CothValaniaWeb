# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :race do
    sequence(:name) { |n| "Race%03d" % n }
  end
end
