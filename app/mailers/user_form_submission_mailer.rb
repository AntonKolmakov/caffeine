class UserFormSubmissionMailer < ActionMailer::Base
  # @param [UserFormSubmission] form_submission
  layout 'mailer'
  def form_submitted(form_submission)
    @form_submission = form_submission

    mail to: @form_submission.email
  end
end
