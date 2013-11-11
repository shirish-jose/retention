# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do

  factory :admin do
    name     'Tester Test'
    email    'test@test.com'
    password 'testington'
  end
end
