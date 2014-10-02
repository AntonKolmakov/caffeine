shared_examples_for 'sluggable' do
  let(:klass) { described_class.new }

  describe 'validations' do
    it 'validates slug presence' do
      expect(klass).to validate_presence_of :slug
    end
  end

  describe '#should_generate_new_friendly_id?' do
    subject { klass.should_generate_new_friendly_id? }

    it 'returns false when slug is fixed by admin' do
      allow(klass).to receive(:fix_slug?).and_return(true)
      expect(subject).to eql(false)
    end

    it 'returns false when slug is not fixed by admin' do
      allow(klass).to receive(:fix_slug?).and_return(false)
      expect(subject).to eql(true)
    end
  end
end
