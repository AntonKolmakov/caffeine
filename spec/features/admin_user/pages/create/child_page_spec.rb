require 'spec_helper'

feature 'admin creates child page' do
  let!(:parent_page) { create(:page, name: 'page parent') }

  scenario do
    admin_session_sign_in

    click_on I18n.t('views.admin.layouts.sidebar.pages')
    click_on I18n.t('views.admin.pages.index.add_new_page')
    fill_in 'page_name', with: 'page child'
    select 'page parent', from: 'page_parent_id'
    click_on I18n.t('helpers.submit.page.create')

    expect(page).to have_content(parent_page.name)
    expect(page).to have_content('page child')
  end
end
