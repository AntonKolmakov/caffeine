require 'spec_helper'

describe Album do
  it { should have_many(:images).order('position') }
  it { should have_many(:pages) }
  it { should validate_presence_of :name }
end
