require 'spec_helper'

feature 'user managed profile', pending: 'wip' do
  let!(:admin) { create(:admin) }
  let!(:user) { create(:user) }
  before { admin_session_sign_in(user) }

  scenario 'user can not destroy self profile' do
    fail
    # find('.profile a.dropdown-toggle').click
    # click_on(I18n.t('views.admin.layouts.header.dropdown.edit_profile'))
    #
    # expect(page).to have_no_content(I18n.t('views.admin.users.edit.link.delete_user'))
  end

  scenario 'can edit self profile and get the flash with success update' do
    fail
    # find('.profile a.dropdown-toggle').click
    # click_on(I18n.t('views.admin.layouts.header.dropdown.edit_profile'))
    #
    # fill_in('user_full_name', with: 'joey tribbiani')
    # fill_in('user_email', with: 'joe@example.com')
    # fill_in('user_password', with: 'secret')
    # fill_in('user_password_confirmation', with: 'secret')
    #
    # click_on I18n.t('helpers.submit.user.update')
    #
    # expect(page).to have_content(I18n.t('flash.actions.update.notice'))
  end
end
