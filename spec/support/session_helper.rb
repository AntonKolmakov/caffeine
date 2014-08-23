def admin_session_sign_in
  user = create(:admin_user)

  visit new_casein_admin_user_session_path

  fill_in 'casein_admin_user_session_login', with: user.login
  fill_in 'casein_admin_user_session_password', with: user.password

  click_button 'Sign in'
end
