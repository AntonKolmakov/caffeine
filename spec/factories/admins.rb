FactoryGirl.define do
  factory :admin, class: 'User' do
    full_name { 'Admin' }
    email { 'admin@example.com' }
    password { '123456' }
  end
end
