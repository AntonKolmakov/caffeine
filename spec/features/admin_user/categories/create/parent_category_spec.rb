require 'spec_helper'

feature 'admin create category' do
  scenario 'successfully add parent category' do
    admin_session_sign_in

    click_on 'Add a new category'
    fill_in 'Name', with: 'category parent'
    click_on 'Add new category'

    expect(page).to have_content('category parent')
  end
end