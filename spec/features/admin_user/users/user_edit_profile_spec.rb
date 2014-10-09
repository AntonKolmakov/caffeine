require 'spec_helper'

feature 'user can edit profile' do
  let!(:admin) { create(:admin) }
  let!(:user) { create(:user) }
  before { admin_session_sign_in(user) }

  scenario 'user can not destroy admin profile' do
    click_link I18n.t('views.admin.layouts.header.dropdown.edit_profile')

    expect(page).to have_no_content(I18n.t('views.admin.users.edit.link.delete_user'))
  end

  scenario 'user can not destroy self profile' do
    click_link I18n.t('views.admin.layouts.header.dropdown.edit_profile')

    expect(page).to have_no_content(I18n.t('views.admin.users.edit.link.delete_user'))
  end
end
