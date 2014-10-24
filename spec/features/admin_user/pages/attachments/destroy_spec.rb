require 'spec_helper'

feature 'admin destroys attachment', js: true do
  let!(:user_page) { create :page, description: 'description goes here...' }

  scenario do
    admin_session_sign_in

    click_on I18n.t('views.admin.layouts.sidebar.pages')
    click_on user_page.name
    attach_file('page_attachment[attachment]', File.expand_path('spec/fixtures/pages/attachments/документ.pdf'))
    click_on I18n.t('views.admin.pages.edit.remove_attachment')

    expect(page).to have_content(I18n.t('flash.actions.destroy.notice'))
  end
end
