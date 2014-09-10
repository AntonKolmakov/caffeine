require 'spec_helper'

describe PageDecorator do
  let(:user_page) { build_stubbed(:page, name: 'school', slug: 'school').decorate }

  describe '#partial_name' do
    it 'has valid partial name for Page' do
      File.stub(:exist?).and_return(true)

      expect(user_page.partial_name).to eql user_page.slug
    end

    it 'returns base partial name when no custom partial exists' do
      File.stub(:exist?).and_return(false)

      expect(user_page.partial_name).to eql PageDecorator::BASE_PARTIAL_NAME
    end
  end
end
