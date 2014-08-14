require 'spec_helper'

feature 'admin create post' do
  scenario 'successfully add post' do
    admin_session_sign_in

    click_link 'Post'
    click_on 'Add a new post'
    fill_in 'Name', with: 'new post1'
    click_on 'Add new post'

    expect(page).to have_content('new post1')
  end
end
