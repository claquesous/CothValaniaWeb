# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :requirement do
    sequence(:name) { |n| "Requirement%03d" % n }
  end
end
