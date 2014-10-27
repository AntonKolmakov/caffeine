require 'spec_helper'

describe ImportData, :vcr do
  describe '#call' do
    subject { ImportData }

    it 'update data and creates a backup' do
      subject.call

      expect(Page.all.any?).to eq true
      expect(Album.all.any?).to eq true
      expect(File.exist?('tmp/backup-json-data')).to eq true
    end

    it 'roll back changes from s3' do
      subject.call(action: 'rollback')

      expect(Page.all.any?).to eq false
      expect(Album.all.any?).to eq false
    end
  end
end
