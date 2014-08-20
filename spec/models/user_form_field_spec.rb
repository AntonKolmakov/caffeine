require 'spec_helper'

describe UserFormField do
  it { should belong_to :user_form }

  it { should validate_presence_of :name }
  it { should validate_presence_of :field_type }
  it { should ensure_inclusion_of(:field_type).in_array(UserFormField::KINDS.keys.map(&:to_s)) }

  it 'has valid factory' do
    field = FactoryGirl.build(:user_form_field, user_form: mock_model(UserForm))
    expect(field).to be_valid
  end
end
