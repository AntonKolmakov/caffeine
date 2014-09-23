FactoryGirl.define do
  factory :user_form_submission do
    user_form { nil }
    field_values { create(:user_form_field) }
  end
end
