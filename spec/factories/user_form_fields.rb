FactoryGirl.define do
  factory :user_form_field do
    name { Faker::Lorem.word }
    field_type { 'text' }
    required { true }
    show_in_admin_table { true }
    user_form
  end
end
