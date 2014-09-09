require 'spec_helper'

feature 'admin creates parent category' do
  scenario do
    admin_session_sign_in

    click_on I18n.t('views.casein.categories.index.add_new_category')
    fill_in I18n.t('views.casein.categories.form.name'), with: 'category parent'
    click_on I18n.t('helpers.submit.category.create')

    expect(page).to have_content('category parent')
  end
end
