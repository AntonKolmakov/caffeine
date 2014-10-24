require 'spec_helper'

feature 'admin creates album' do
  scenario do
    admin_session_sign_in

    click_on I18n.t('views.admin.layouts.sidebar.albums')
    click_on I18n.t('views.admin.albums.index.add_new_album')
    fill_in 'album_name', with: 'Album-1'
    fill_in 'album_short_description', with: 'Short description'
    fill_in 'album_description', with: 'description'
    fill_in 'album_slug', with: 'rundom slug'
    check 'album_fix_slug'

    click_on I18n.t('helpers.submit.album.create')

    expect(page).to have_content(I18n.t('flash.actions.create.notice'))
  end
end
