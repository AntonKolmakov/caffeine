require 'spec_helper'

feature 'admin creates child category' do
  let!(:parent_category) { create(:category, name: 'category parent') }

  scenario do
    admin_session_sign_in

    click_on I18n.t('views.casein.categories.index.add_new_category')
    fill_in I18n.t('views.casein.categories.form.name'), with: 'category child'
    select 'category parent', from: I18n.t('views.casein.categories.form.parent_id')
    click_on I18n.t('helpers.submit.category.create')

    expect(page).to have_content(parent_category.name)
    expect(page).to have_content('category child')
  end
end
