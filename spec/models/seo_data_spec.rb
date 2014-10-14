require 'spec_helper'

describe SeoDatum do
  it { is_expected.to belong_to :datable }
  it { should belong_to :datable }
end