require 'spec_helper'

feature 'admin creates new user form' do
  scenario do
    admin_session_sign_in

    click_link I18n.t('views.casein.layouts.tab_navigation.user_forms')
    click_on I18n.t('views.casein.user_forms.index.add_new_user_form')

    fill_in UserForm.human_attribute_name(:name), with: 'My first dynamic form'
    fill_in UserForm.human_attribute_name(:email), with: Faker::Internet.email
    fill_in UserForm.human_attribute_name(:alias), with: 'supalias'
    fill_in UserFormField.human_attribute_name(:name), with: 'Text field'
    select(UserFormField::KINDS[:text], from: UserFormField.human_attribute_name(:field_type))
    check(UserFormField.human_attribute_name(:required))

    click_on I18n.t('helpers.submit.user_form.create')

    expect(page).to have_content('My first dynamic form')
  end
end
