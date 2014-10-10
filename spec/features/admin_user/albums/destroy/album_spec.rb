require 'spec_helper'

feature 'admin destroys album' do
  let!(:new_album) { create(:album, name: 'Album-1') }

  scenario do
    admin_session_sign_in

    click_on I18n.t('views.admin.layouts.sidebar.albums')
    click_on new_album.name
    click_on I18n.t('views.admin.albums.edit.link.remove_album')

    expect(page).to have_content(I18n.t('flash.actions.destroy.notice'))
  end
end
