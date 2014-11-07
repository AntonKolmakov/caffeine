require 'spec_helper'

describe SeoDatum do
  it { is_expected.to belong_to :datable }

  it 'enables paper trail' do
    is_expected.to be_versioned
  end
end
