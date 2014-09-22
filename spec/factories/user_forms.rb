FactoryGirl.define do
  factory :user_form do
    name { Faker::Lorem.word }
    email { 'admin@example.com' }
    factory :nested_fields do
      ignore do
        user_form_count 1
      end

      after(:create) do |user_form, evaluator|
        create_list(:user_form_field, evaluator.user_form_count, user_form: user_form)
      end
    end
  end
end
