require 'spec_helper'

feature 'show link to album due conditions' do
  scenario 'images more then eight' do
    album = create(:album, :with_images)
    home_page = create(:page, name: 'base', album_id: album.id)

    visit page_path(home_page)

    expect(page).to have_content(I18n.t('views.pages.show.link.view_album'))
  end

  scenario 'images less then eight' do
    album = create(:album, :with_images, images_count: 4)
    home_page = create(:page, name: 'base', album_id: album.id)

    visit page_path(home_page)

    expect(page).to have_no_content(I18n.t('views.pages.show.link.view_album'))
  end
end
