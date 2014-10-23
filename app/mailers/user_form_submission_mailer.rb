class UserFormSubmissionMailer < ActionMailer::Base
  layout 'mailer'

  # @param [UserFormSubmission] form_submission
  def form_submitted(form_submission)
    @form_submission = form_submission

    mail to: @form_submission.email
  end
end
