require 'spec_helper'

describe UserForm do
  it { should validate_presence_of :name }
  it { should validate_presence_of :email }
  it { should allow_value('test@example.com').for(:email) }
  it { should_not allow_value('tes_at_example.com').for(:email) }
end
