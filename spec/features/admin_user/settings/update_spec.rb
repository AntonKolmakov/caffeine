require 'spec_helper'

feature 'SuperAdmin can update site settings' do
  let(:admin) { FactoryGirl.create(:super_admin) }
  before { admin_session_sign_in(admin) }

  scenario do
    click_on I18n.t('settings.index.title')

    fill_in 'settings_yandex_metrika_key', with: 'YA_123'
    click_on I18n.t('settings.index.save_all')

    expect(find_field('settings_yandex_metrika_key').value).to eq 'YA_123'
    expect(Setting.yandex_metrika_key).to eq 'YA_123'
  end
end

feature 'Basic admin can not update site settings' do
  before { admin_session_sign_in }

  scenario do
    expect(page).to have_no_content(I18n.t('settings.index.title'))
  end

  scenario do
    visit rails_settings_ui_path

    expect(page).to have_content('This is start page : )')
    expect(page).to have_no_content(I18n.t('settings.index.save_all'))
  end
end
