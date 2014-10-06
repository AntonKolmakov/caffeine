require 'spec_helper'

describe UserFormSubmissionMailer, type: :mailer do
  describe 'form_submitted' do
    let(:user_form_submission) { double('UserFormSubmission') }
    let(:email) { UserFormSubmissionMailer.form_submitted(user_form_submission) }

    before do
      allow(user_form_submission).to receive_messages(email: 'test@example.com')
    end

    it 'should deliver to a given email' do
      expect(email).to deliver_to(user_form_submission.email)
    end

    it 'should be sent from proper address' do
      expect(email).to deliver_from('noreply@promtehnosert.ru')
    end

    it 'should have proper body' do
      expect(email).to have_body_text(/Кто-то заполнил форму/)
    end
  end
end
