require 'spec_helper'

describe Page do
  it { should have_many :page_attachments }
  it { should validate_presence_of :name }
  it_behaves_like 'sluggable'
end
