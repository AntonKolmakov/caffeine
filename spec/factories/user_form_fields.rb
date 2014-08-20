FactoryGirl.define do
  factory :user_form_field do
    name { Faker::Lorem.word }
    field_type { UserFormField::KINDS.keys.sample.to_s }
    required { false }
    user_form { nil }
  end
end
