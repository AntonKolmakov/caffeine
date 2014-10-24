require 'spec_helper'

describe UserFormField do
  it { should belong_to :user_form }
  it { should have_many(:available_values).class_name('UserFormFieldValue') }

  it { should validate_presence_of :type }
  it { should validate_inclusion_of(:type).in_array(UserFormField::TYPES.keys.map(&:to_s)) }

  it 'has valid factory' do
    field = FactoryGirl.build(:user_form_field, user_form: mock_model(UserForm))
    expect(field).to be_valid
  end
end
