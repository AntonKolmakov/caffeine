FactoryGirl.define do
  factory :user_form_field do
    type { 'TextField' }
    required { true }
    show_in_admin_table { true }
    user_form
  end
end
