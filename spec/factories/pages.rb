FactoryBot.define do
  factory :page do
    name { Faker::Name.name }
    short_description { Faker::Lorem.sentence }
    description { Faker::Lorem.sentence(3) }
  end
end
