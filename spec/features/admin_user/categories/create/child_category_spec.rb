require 'spec_helper'

feature 'admin creates child category' do
  let!(:parent_category) { create(:category, name: 'category parent') }

  scenario do
    admin_session_sign_in

    click_on 'Add a new category'
    fill_in 'Name', with: 'category child'
    select 'category parent', from: 'Parent'
    click_on 'Submit'

    expect(page).to have_content(parent_category.name)
    expect(page).to have_content('category child')
  end
end
