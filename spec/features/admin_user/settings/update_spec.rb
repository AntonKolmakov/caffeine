require 'spec_helper'

feature 'Site settings' do
  let(:admin) { FactoryGirl.create(:super_admin) }

  before { admin_session_sign_in(admin) }

  scenario 'super admin updates site settings' do
    click_on I18n.t('settings.index.title')

    fill_in 'settings_yandex_metrika_key', with: 'YA_123'
    click_on I18n.t('settings.index.save_all')

    expect(find_field('settings_yandex_metrika_key').value).to eq 'YA_123'
    expect(Setting.yandex_metrika_key).to eq 'YA_123'
  end
end
