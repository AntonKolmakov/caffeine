require 'spec_helper'

feature 'admin destroys user', js: true do
  let!(:new_user) { create(:user) }

  scenario do
    admin_session_sign_in

    click_link I18n.t('views.admin.layouts.sidebar.users')
    click_link new_user.email
    click_on I18n.t('views.admin.users.edit.link.delete_user')
    page.accept_alert

    expect(page).to have_content(I18n.t('flash.actions.destroy.notice'))
  end
end
