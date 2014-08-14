FactoryGirl.define do
  factory :admin_user, class: 'Casein::AdminUser' do
    login { 'admin' }
    name { 'Admin' }
    email { 'admin@example.com' }
    access_level { 0 }
    password { '123456' }
    password_confirmation { '123456' }
  end
end
