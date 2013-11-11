# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do

  factory :recommendation do
    association :user
    association :item
    weight      1
  end
end
