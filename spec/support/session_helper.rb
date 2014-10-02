def admin_session_sign_in
  user = FactoryGirl.create(:admin)

  visit '/admin'

  fill_in 'user_email', with: user.email
  fill_in 'user_password', with: user.password

  click_button I18n.t('app.user.sign_in.title')
end
