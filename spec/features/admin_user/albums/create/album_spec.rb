require 'spec_helper'

feature 'admin creates album' do
  scenario do
    admin_session_sign_in

    click_on I18n.t('views.casein.layouts.tab.albums')
    click_on I18n.t('views.casein.albums.index.add_new_album')
    fill_in 'Name', with: 'Album-1'
    click_on I18n.t('app.form.save')

    expect(page).to have_content(I18n.t('flash.actions.create.notice'))
  end
end
