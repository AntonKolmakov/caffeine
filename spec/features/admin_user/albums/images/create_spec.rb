require 'spec_helper'

feature 'admin should attach a image', js: true do
  let!(:album) { create :album }

  scenario do
    admin_session_sign_in

    click_on I18n.t('views.admin.layouts.sidebar.albums')
    click_on album.name
    attach_file('image[picture]', File.expand_path('spec/fixtures/albums/images/south_park.jpg'))

    expect(page).to have_content('south_park')
  end
end
