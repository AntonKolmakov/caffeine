class AmazonService
  include Interactor::Organizer

  organize  FetchData, DeflateData, BackupData, ImportData
end