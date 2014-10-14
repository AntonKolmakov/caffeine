require 'spec_helper'

feature 'admin updates page image', js: true do
  let!(:new_page) { create :page }

  scenario do
    admin_session_sign_in

    click_on I18n.t('views.admin.layouts.sidebar.pages')
    click_on new_page.name

    attach_file('page_page_image_attributes_picture', File.expand_path('spec/fixtures/albums/images/south_park.jpg'))

    click_on I18n.t('helpers.submit.page.update')

    expect(page).to have_content((I18n.t('flash.actions.update.notice')))
    expect(page).to have_selector("img[src='/uploads/page_image/picture/1/thumb_south_park.jpg']")
  end
end
