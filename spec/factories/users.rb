FactoryBot.define do
  factory :user do
    full_name { 'User' }
    email { 'user@example.com' }
    password { '123456' }
    password_confirmation { '123456' }
  end
end
