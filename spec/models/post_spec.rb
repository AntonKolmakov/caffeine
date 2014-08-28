require 'spec_helper'

describe Post do
  it { should belong_to :category }
  it { should validate_presence_of :name }

  describe '#should_generate_new_friendly_id?' do
    let(:post) { build_stubbed(:post, name: 'post') }
    subject { post.should_generate_new_friendly_id? }

    it 'returns false slug is fixed by admin' do
      post.stub(fix_slug?: true)
      expect(subject).to be_false
    end

    it 'returns false slug is not fixed by admin' do
      post.stub(fix_slug?: false, slug_changed?: true)
      expect(subject).to be_true
    end

    it 'returns true slug fixed by admin and not named' do
      post.stub(fix_slug?: true, slug: '')
      expect(subject).to be_true
    end
  end
end
