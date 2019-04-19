FactoryBot.define do
  factory :admin, class: 'User' do
    full_name { 'Admin' }
    email { 'admin@example.com' }
    password { '123456' }
    password_confirmation { '123456' }
    factory :super_admin do
      # admin true
    end
  end
end
