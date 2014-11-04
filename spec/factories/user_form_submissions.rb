FactoryGirl.define do
  factory :user_form_submission do
    user_form { build_stubbed :user_form }
    field_values { build_stubbed_list :user_form_submission_field_value, 2 }

    initialize_with do
      new(attributes)
    end
  end
end
