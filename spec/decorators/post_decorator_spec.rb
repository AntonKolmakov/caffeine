require 'spec_helper'

describe PostDecorator do
  let(:post) { build_stubbed(:post, name: 'moto', slug: 'moto').decorate }

  describe "#partial_name" do
    it 'has valid partial name for Post' do
      expect(post.partial_name).to eql post.slug
    end

    it 'returns base partial name when no custom partial exists' do
      File.stub(:exists?).and_return(false)

      expect(post.partial_name).to eql PostDecorator::BASE_PARTIAL_NAME
    end
  end
end
