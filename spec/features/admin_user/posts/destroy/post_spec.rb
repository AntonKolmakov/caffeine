require 'spec_helper'

feature 'admin destroys post' do
  let!(:newpost) { create(:post, name: 'newpost') }

  scenario do
    admin_session_sign_in

    click_link 'Post'
    click_link newpost.name
    click_link 'Delete'

    expect(page).not_to have_content('newpost')
  end
end
