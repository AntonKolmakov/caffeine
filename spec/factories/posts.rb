FactoryGirl.define do
  factory :post do
    name { Faker::Name.name }
    slug { |p| p.name.parameterize }
  end
end
