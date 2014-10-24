require 'spec_helper'

feature 'admin creates parent page' do
  scenario do
    admin_session_sign_in

    click_on I18n.t('views.admin.layouts.sidebar.pages')
    click_on I18n.t('views.admin.pages.index.add_new_page')
    fill_in I18n.t('activerecord.attributes.page.name'), with: 'page parent'
    click_on I18n.t('helpers.submit.page.create')

    expect(page).to have_content('page parent')
  end
end
