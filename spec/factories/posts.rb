FactoryGirl.define do
  factory :post do
    name { Faker::Name.name }
  end
end
