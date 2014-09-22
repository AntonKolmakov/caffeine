require 'spec_helper'

feature 'user creates submission form', js: true do
  let!(:home_page) { create(:page, name: 'Home') }
  let!(:form_submission) { create(:nested_fields) }

  scenario 'user successfully creates submission form' do
    visit root_path

    fill_in form_submission.user_form_fields.last.name, with: 'test'

    click_on I18n.t('helpers.submit.user_form_submission.create')

    expect(page).to have_content(I18n.t('flash.user_forms.user_form_submissions.create.notice'))
  end

  scenario 'returns error message if required field is blank' do
    visit root_path

    fill_in form_submission.user_form_fields.last.name, with: ''

    click_on I18n.t('helpers.submit.user_form_submission.create')

    expect(page).to have_content(I18n.t('flash.user_forms.user_form_submissions.create.warning'))
  end
end
