require 'spec_helper'

describe PostAttachment do
  it { should belong_to :post }
end
