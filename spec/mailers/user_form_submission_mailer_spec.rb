require 'spec_helper'

describe UserFormSubmissionMailer, type: :mailer do
  describe 'form_submitted' do
    let(:user_form_submission) { FactoryGirl.build_stubbed :user_form_submission }
    let(:email) { UserFormSubmissionMailer.form_submitted(user_form_submission) }

    it 'should deliver to a given email' do
      expect(email).to deliver_to(user_form_submission.email)
    end

    it 'should be sent from proper address' do
      expect(email).to deliver_from('noreply@promtehnosert.ru')
    end

    it 'should have proper body' do
      expect(email).to have_body_text(/Сообщение с формы - #{user_form_submission.user_form_name}/)
    end
  end
end
