FactoryGirl.define do
  factory :user_form do
    name { Faker::Lorem.word }
    email { 'admin@example.com' }
    trait :with_fields do
      ignore do
        fields_count 1
      end

      after(:create) do |user_form, evaluator|
        create_list(:user_form_field, evaluator.fields_count, user_form: user_form)
      end
    end
  end
end
