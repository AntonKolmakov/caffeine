FactoryGirl.define do
  factory :user_form_field, class: 'UserForm::Field' do
    name { Faker::Lorem.word }
    field_type { UserForm::Field::KINDS.keys.sample.to_s }
    required { false }
    user_form { nil }
  end
end
