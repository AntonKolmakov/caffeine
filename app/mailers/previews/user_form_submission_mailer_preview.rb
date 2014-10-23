class UserFormSubmissionMailerPreview < ActionMailer::Preview
  def form_submitted
    user_form_submission = UserFormSubmission.last
    UserFormSubmissionMailer.form_submitted(user_form_submission)
  end
end
