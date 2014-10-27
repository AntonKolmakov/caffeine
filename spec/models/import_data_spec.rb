require 'spec_helper'

describe ImportData do
  describe '#call' do
    subject { ImportData.new }
    let(:bucket) { Rails.root.join('spec', 'fixtures', 'my-json-data') }
    before { allow(subject).to receive_messages(download_from_s3: bucket) }

    it 'update data and creates a backup' do
      ImportData.call

      expect(Page.all.any?).to eq true
      expect(Page.all.any?).to eq true
      expect(File.exist?('tmp/backup-json-data')).to eq true
    end

    it 'roll back changes from s3' do
      ImportData.call(action: 'rollback')

      expect(Page.all.any?).to eq false
      expect(Album.all.any?).to eq false
    end
  end
end
