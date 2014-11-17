require 'spec_helper'

feature 'when updating page', versioning: true do
  let!(:user_page) { create :page }
  let!(:user) { create :admin }

  before { admin_session_sign_in(user) }

  scenario 'admin switches versions of the pages' do
    click_on I18n.t('views.admin.layouts.sidebar.pages')
    click_on user_page.name

    fill_in 'page_name', with: 'version-1'

    click_on I18n.t('helpers.submit.page.update')

    click_on('Rollback version')

    expect(page).to have_content(user_page.name)
  end
end
