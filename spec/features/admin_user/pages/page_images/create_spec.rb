require 'spec_helper'

feature 'admin creates page image', js: true do
  scenario do
    admin_session_sign_in

    click_on I18n.t('views.admin.layouts.sidebar.pages')
    click_on I18n.t('views.admin.pages.index.add_new_page')

    fill_in I18n.t('activerecord.attributes.page.name'), with: 'page parent'

    all('.tabs__tab')[2].click

    attach_file(
        'page_page_image_attributes_picture',
        File.expand_path('spec/fixtures/albums/images/south_park.jpg'),
        visible: false)

    click_on I18n.t('helpers.submit.page.create')

    all('.tabs__tab')[2].click

    expect(page).to have_content((I18n.t('flash.actions.create.notice')))
    expect(page).to have_selector("img[src='/uploads/page_image/picture/1/thumb_south_park.jpg']")
  end
end
