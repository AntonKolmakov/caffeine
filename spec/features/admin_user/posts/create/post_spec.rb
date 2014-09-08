require 'spec_helper'

feature 'admin creates post' do
  scenario do
    admin_session_sign_in

    click_link I18n.t('views.casein.layouts.tab_navigation.posts')
    click_on I18n.t('views.casein.posts.index.add_new_post')
    fill_in I18n.t('views.casein.posts.form.name'), with: 'new post1'
    fill_in I18n.t('views.casein.posts.form.description'), with: 'description'
    click_on I18n.t('helpers.submit.post.create')

    expect(page).to have_content('new post1')
  end
end
