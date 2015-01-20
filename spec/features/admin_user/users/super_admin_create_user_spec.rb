require 'spec_helper'

feature 'admin creates new user' do
  let(:admin) { create :super_admin }

  scenario do
    admin_session_sign_in(admin)

    click_link I18n.t('views.admin.layouts.sidebar.users')
    click_link I18n.t('views.admin.users.index.link.new_user')

    find('#user_full_name').set('joey tribbiani')
    find('#user_email').set('joe@example.com')
    find('#user_password').set('secret')
    find('#user_password_confirmation').set('secret')

    click_on I18n.t('helpers.submit.user.create')

    expect(page).to have_content(I18n.t('flash.actions.create.notice'))
  end
end
