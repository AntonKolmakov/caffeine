require 'spec_helper'

describe Page do
  it { should have_many :page_attachments }
  it { should belong_to(:album) }
  it { should validate_presence_of :name }
  it_behaves_like 'sluggable'

  it 'enables paper trail' do
    is_expected.to be_versioned
  end
end
