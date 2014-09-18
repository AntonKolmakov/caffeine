require 'spec_helper'

describe Album do
  it { should have_many(:images).order('position') }
  it { should validate_presence_of :name }
  it { should belong_to(:page) }
end
