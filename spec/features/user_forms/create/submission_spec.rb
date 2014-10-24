require 'spec_helper'

feature 'user creates submission form', js: true, pending: 'Validation not implemented' do
  let!(:home_page) { create(:page, name: 'Home') }
  let!(:user_form) { create(:user_form, :with_fields) }

  scenario 'user successfully creates submission form' do
    visit root_path

    fill_in user_form.user_form_fields.last.name, with: 'test'

    click_on I18n.t('helpers.submit.user_form_submission.create')

    expect(page).to have_content(I18n.t('flash.user_forms.user_form_submissions.create.notice'))
  end

  scenario 'returns error message if required field is blank' do
    visit root_path

    fill_in user_form.user_form_fields.last.name, with: ''

    click_on I18n.t('helpers.submit.user_form_submission.create')

    expect(page).to have_content(I18n.t('flash.user_forms.user_form_submissions.create.warning'))
  end
end
