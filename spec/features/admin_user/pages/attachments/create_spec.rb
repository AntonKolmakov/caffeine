require 'spec_helper'

feature 'admin creates attachment', js: true do
  let!(:user_page) { create :page }

  scenario do
    admin_session_sign_in

    click_on I18n.t('views.admin.layouts.sidebar.pages')
    click_on user_page.name
    attach_file('page_attachment[attachment]', File.expand_path('spec/fixtures/pages/attachments/документ.pdf'))

    expect(page).to have_content('dokument.pdf')
  end
end
