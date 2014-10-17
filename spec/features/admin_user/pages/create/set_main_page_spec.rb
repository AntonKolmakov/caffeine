require 'spec_helper'

feature 'admin check to main page' do
  let!(:new_main_page) { create(:page) }
  let!(:old_main_page) { create(:page, main: true) }

  before do
    admin_session_sign_in

    click_on I18n.t('views.admin.layouts.sidebar.pages')
  end

  scenario 'main page can be only one' do
    click_on new_main_page.name
    check 'page_main'

    click_on I18n.t('helpers.submit.page.update')

    expect(page).to have_content(I18n.t('flash.actions.update.notice'))
    expect(new_main_page.reload.main?).to eq(true)
  end

  scenario 'admin can set main page jast from pages#index' do

    click_on 'set_main'

    expect().to
  end
end
