require 'spec_helper'

describe Post do
  it { should belong_to :category }
  it { should validate_presence_of :name }
  it { should be_kind_of(Sluggable) }
end
