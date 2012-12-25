# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :news do
    sequence(:text) { |n| "News text %03d" % n }
    member
  end
end
