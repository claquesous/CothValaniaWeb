# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :event do
  	name 'Event'
	points { rand(3) }
  end
end
