FactoryGirl.define do
  factory :album do
    name { Faker::Name.name }
    trait :with_images do
      ignore do
        images_count 10
      end

      after(:create) do |album, evaluator|
        create_list(:image, evaluator.images_count, album: album)
      end
    end
  end
end
