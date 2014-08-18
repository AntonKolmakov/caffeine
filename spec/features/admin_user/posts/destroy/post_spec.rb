require 'spec_helper'

feature 'admin destroys post' do
  let!(:new_post) { create(:post, name: 'newpost') }

  scenario do
    admin_session_sign_in

    click_link 'Post'
    click_link new_post.name
    click_link 'Delete'

    expect(page).not_to have_content(new_post.name)
  end
end
