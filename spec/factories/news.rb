# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :news do
    date {Time.now}
    sequence(:text) { |n| "News text #{n}" }
    member
  end
end
