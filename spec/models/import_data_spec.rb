require 'spec_helper'

describe ImportData do
  describe '#call' do
    let(:bucket) { Rails.root.join('spec', 'fixtures', 'my-json-data') }

    it 'updates data' do
      allow_any_instance_of(ImportData).to receive_messages(local_file_path: bucket)
      allow_any_instance_of(ImportData).to receive(:download_from_s3)
      allow_any_instance_of(ImportData).to receive(:create_backup)

      described_class.call

      expect(Page.all.count).to eq 1
      expect(Album.all.count).to eq 1
    end

    it 'creates backup on import' do
      allow_any_instance_of(ImportData).to receive_messages(local_file_path: bucket)
      allow_any_instance_of(ImportData).to receive(:download_from_s3)

      described_class.call

      expect(File.exist?('tmp/backup-json-data')).to eq true
    end

    it 'roll back changes from s3' do
      described_class.call(rollback: true)

      expect(Page.all.any?).to eq false
      expect(Album.all.any?).to eq false
    end
  end
end
