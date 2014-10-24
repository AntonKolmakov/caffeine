def admin_session_sign_in(user = nil)
  user ||= FactoryGirl.create(:admin)

  visit '/admin'

  fill_in 'admin_user_email', with: user.email
  fill_in 'admin_user_password', with: user.password

  click_button I18n.t('app.user.sign_in.title')
end
