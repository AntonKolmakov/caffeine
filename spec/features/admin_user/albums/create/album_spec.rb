require 'spec_helper'

feature 'admin creates album' do
  scenario do
    admin_session_sign_in

    click_on I18n.t('views.admin.layouts.top_navigation.albums')
    click_on I18n.t('views.admin.albums.index.add_new_album')
    fill_in I18n.t('activerecord.attributes.album.name'), with: 'Album-1'
    click_on I18n.t('helpers.submit.album.create')

    expect(page).to have_content(I18n.t('flash.actions.create.notice'))
  end
end
