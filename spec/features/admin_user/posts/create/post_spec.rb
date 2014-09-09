require 'spec_helper'

feature 'admin creates post' do
  scenario do
    admin_session_sign_in

    click_link I18n.t('views.casein.layouts.tab.posts')
    click_on I18n.t('views.casein.posts.index.add_new_post')
    fill_in 'Name', with: 'new post1'
    click_on 'Submit'

    expect(page).to have_content('new post1')
  end
end
