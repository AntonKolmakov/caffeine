shared_examples 'sluggable' do
  let(:klass) { described_class.new }

  describe 'validations' do
    it 'validates slug presence' do
      expect(klass).to validate_presence_of :slug
    end
  end

  describe '#should_generate_new_friendly_id?' do
    subject { klass.should_generate_new_friendly_id? }

    it 'returns false when slug is fixed by admin' do
      klass.stub(fix_slug?: true)
      expect(subject).to be_false
    end

    it 'returns false when slug is not fixed by admin' do
      klass.stub(fix_slug?: false)
      expect(subject).to be_true
    end
  end
end
