require 'spec_helper'

feature 'user managed profile' do
  let!(:admin) { create(:admin) }
  let!(:user) { create(:user) }
  before do
    admin_session_sign_in(user)

    find('a.dropdown-toggle').click
    click_on(I18n.t('views.admin.layouts.header.dropdown.edit_profile'))
  end

  scenario 'user cannot destroy self profile' do
    expect(page).to have_no_content(I18n.t('views.admin.users.edit.link.delete_user'))
  end

  scenario 'user can edit self profile and get the flash with success update' do
    fill_in('user_full_name', with: 'joey tribbiani')
    fill_in('user_email', with: 'joe@example.com')
    fill_in('user_password', with: 'secret')
    fill_in('user_password_confirmation', with: 'secret')

    click_on I18n.t('helpers.submit.user.update')

    expect(page).to have_content(I18n.t('flash.actions.update.notice'))
  end

  scenario "user cannot update another user's profile" do
    visit edit_admin_user_path(admin)

    expect(page).to have_no_content(I18n.t('views.admin.users.edit.header'))
  end

  scenario 'raises an flash error if email and full_name is blank' do
    fill_in('user_full_name', with: '')
    fill_in('user_email', with: '')

    click_on I18n.t('helpers.submit.user.update')

    expect(page).to have_content(I18n.t('flash.actions.update.warning'))
  end

  scenario 'allow users to edit their account without providing a password' do
    fill_in('user_password', with: '')
    fill_in('user_password_confirmation', with: '')

    click_on I18n.t('helpers.submit.user.update')

    expect(page).to have_content(I18n.t('flash.actions.update.notice'))
  end

  scenario 'raises an flash error if one of password field is enter' do
    fill_in('user_full_name', with: 'joey tribbiani')
    fill_in('user_email', with: 'joe@example.com')
    fill_in('user_password', with: 'secret')
    fill_in('user_password_confirmation', with: '')

    click_on I18n.t('helpers.submit.user.update')

    expect(page).to have_content(I18n.t('flash.actions.update.warning'))
  end
end
