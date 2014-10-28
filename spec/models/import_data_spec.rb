require 'spec_helper'

describe ImportData do
  describe '#call' do
    let(:bucket) { Rails.root.join('spec', 'fixtures', 'my-json-data') }

    it 'updates data' do
      allow_any_instance_of(ImportData).to receive_messages(local_file_path: bucket)
      allow_any_instance_of(ImportData).to receive(:download_from_s3)
      allow_any_instance_of(ImportData).to receive(:create_backup)

      described_class.call

      expect(Page.all).not_to be_empty
      expect(Album.all).not_to be_empty
    end

    it 'creates backup on import' do
      allow_any_instance_of(ImportData).to receive_messages(local_file_path: bucket)
      allow_any_instance_of(ImportData).to receive(:download_from_s3)

      described_class.call

      expect(File.exist?('tmp/backup-json-data')).to eq true
    end

    it 'roll back changes from s3' do
      described_class.call(rollback: true)

      expect(Page.all).to be_empty
      expect(Album.all).to be_empty
    end
  end
end
