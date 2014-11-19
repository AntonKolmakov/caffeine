require 'spec_helper'

describe ImportProductionSiteData::Import do
  describe '#call' do
    let(:bucket) { Rails.root.join('spec', 'fixtures', 'my-json-data') }

    it 'updates data' do
      allow_any_instance_of(ImportProductionSiteData::Fetch).to receive_messages(local_file_path: bucket)
      allow_any_instance_of(ImportProductionSiteData::Fetch).to receive(:download_from_aws)
      allow(UnpackData).to receive(:call)

      described_class.call

      expect(Page.all).not_to be_empty
      expect(Album.all).not_to be_empty
    end

    it 'creates backup when import occurs' do
      allow_any_instance_of(ImportProductionSiteData::Fetch).to receive_messages(local_file_path: bucket)
      allow_any_instance_of(ImportProductionSiteData::Fetch).to receive(:download_from_aws)

      described_class.call

      expect(File.exist?('tmp/backup-json-data')).to eq true
    end

    it 'rollback changes from s3' do
      RollbackImportedData::Rollback.call

      expect(Page.all).to be_empty
      expect(Album.all).to be_empty
    end
  end
end
