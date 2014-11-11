class AmazonService
  include Interactor::Organizer

  organize FetchData, DeflateData, BackupData, WriteFile, RecordData
end
