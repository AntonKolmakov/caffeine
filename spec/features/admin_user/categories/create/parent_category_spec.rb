require 'spec_helper'

feature 'admin creates parent category' do
  scenario do
    admin_session_sign_in

    click_on 'Add a new category'
    fill_in 'Name', with: 'category parent'
    click_on 'Submit'

    expect(page).to have_content('category parent')
  end
end
