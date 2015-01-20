require 'spec_helper'

feature 'admin destroys user', js: true do
  let(:admin) { create :super_admin }
  let!(:new_user) { create(:user) }

  scenario do
    admin_session_sign_in(admin)

    click_link I18n.t('views.admin.layouts.sidebar.users')
    click_link new_user.email

    accept_confirm do
      click_on I18n.t('views.admin.users.edit.link.delete_user')
    end

    expect(page).to have_content(I18n.t('flash.actions.destroy.notice'))
  end
end
