# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :job do
    sequence(:name) { |n| "Job#{n}" }
  end
end
