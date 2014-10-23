FactoryGirl.define do
  factory :user_form_submission_field_value do
    field_value 'Some value'
    user_form_field { build_stubbed :user_form_field }
  end
end
