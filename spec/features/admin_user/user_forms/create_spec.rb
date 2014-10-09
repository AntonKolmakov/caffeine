require 'spec_helper'

feature 'admin creates new user form' do
  scenario do
    admin_session_sign_in

    click_link I18n.t('views.admin.layouts.sidebar.user_forms')
    click_on I18n.t('views.admin.user_forms.index.add_new_user_form')

    fill_in I18n.t('activerecord.attributes.user_form.name'), with: 'My first dynamic form'
    fill_in I18n.t('activerecord.attributes.user_form.email'), with: Faker::Internet.safe_email
    fill_in I18n.t('activerecord.attributes.user_form.alias'), with: 'supalias'
    select(UserFormField::TYPES[:TextField], from: I18n.t('activerecord.attributes.user_form_field.field_type'))

    click_on I18n.t('helpers.submit.user_form.create')

    expect(page).to have_content(I18n.t('flash.actions.create.notice'))
  end
end
