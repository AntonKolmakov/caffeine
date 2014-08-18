FactoryGirl.define do
  factory :user_form do
    name { Faker::Lorem.words }
    email { Faker::Internet.email }
  end
end
