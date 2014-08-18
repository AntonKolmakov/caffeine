require 'spec_helper'

feature 'admin destroys category' do
  let!(:category) { create(:category, name: 'category parent') }

  scenario do
    admin_session_sign_in

    click_link category.name
    click_link 'Delete'

    expect(page).not_to have_content('category parent')
  end
end
