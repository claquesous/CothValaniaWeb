# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :occurrence do
    event
    end_time {1.minute.ago}
  end
end
