# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :site_config do
    site_name "Cvweb"
    password "password"
    config_comment "Nothing to see here!"
  end
end
