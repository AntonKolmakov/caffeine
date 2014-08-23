require 'spec_helper'

feature 'admin destroys image', js: true do
  let!(:album) { create :album }

  scenario do
    admin_session_sign_in

    click_on I18n.t('views.casein.layouts.tab.albums')
    click_on album.name
    attach_file('image[picture]', File.expand_path('spec/fixtures/albums/images/south_park.jpg'))
    click_on I18n.t('views.casein.albums.show.link.remove_image')

    expect(page).to have_content(I18n.t('flash.actions.destroy.notice'))
  end
end
