# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do

  factory :purchase do
    association :item
    association :user
  end
end
