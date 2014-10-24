require 'spec_helper'

describe UserFormSubmissionFieldValue do
  it { should belong_to :user_form_submission }
  it { should belong_to :user_form_field }
end
