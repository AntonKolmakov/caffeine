require 'spec_helper'

describe AmazonService do
  describe '#call' do
    let(:bucket) { Rails.root.join('spec', 'fixtures', 'my-json-data') }

    it 'updates data' do
      allow_any_instance_of(FetchData).to receive_messages(local_file_path: bucket)
      allow_any_instance_of(FetchData).to receive(:download_from_s3)
      allow(WriteFile).to receive(:call)

      described_class.call

      expect(Page.all).not_to be_empty
      expect(Album.all).not_to be_empty
    end

    it 'creates backup when import occurs' do
      allow_any_instance_of(FetchData).to receive_messages(local_file_path: bucket)
      allow_any_instance_of(FetchData).to receive(:download_from_s3)

      described_class.call

      expect(File.exist?('tmp/backup-json-data')).to eq true
    end

    it 'rollback changes from s3' do
      RollbackData.call

      expect(Page.all).to be_empty
      expect(Album.all).to be_empty
    end
  end
end
