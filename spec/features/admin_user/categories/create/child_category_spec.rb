require 'spec_helper'

feature 'admin create child category' do
  scenario 'successfully add child category to parent category' do
    create(:category, name: 'category parent')
    admin_session_sign_in

    click_on 'Add a new category'
    fill_in 'Name', with: 'category child'
    select 'category parent', from: 'Parent'
    click_on 'Add new category'

    expect(page).to have_content('category parent')
    expect(page).to have_content('category child')
  end
end
