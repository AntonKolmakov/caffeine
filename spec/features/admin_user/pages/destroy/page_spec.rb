require 'spec_helper'

feature 'admin destroys page' do
  let!(:user_page) { create(:page, name: 'page parent', description: 'desccription...') }

  scenario do
    admin_session_sign_in

    click_link user_page.name
    click_link I18n.t('views.casein.pages.show.delete')

    expect(page).not_to have_content(user_page.name)
  end
end
