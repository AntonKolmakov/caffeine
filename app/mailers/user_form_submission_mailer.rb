class UserFormSubmissionMailer < ActionMailer::Base
  # @param [UserFormSubmission] form_submission
  def form_submitted(form_submission)
    mail to: form_submission.email
  end
end
