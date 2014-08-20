FactoryGirl.define do
  factory :user_form do
    name { Faker::Lorem.word }
    email { Faker::Internet.email }
  end
end
