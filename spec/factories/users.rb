# Read about factories at http://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do |o|
    o.first_name  "Testy"
    o.last_name   "McTesterson"
    o.username    "testa"
    o.email       "test@test.com"
  end
end
