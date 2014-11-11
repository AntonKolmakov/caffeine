class RollbackData
  include Interactor::Organizer

  before do
    context.file_name = 'my-json-data'
    context.local_file_path = "#{Rails.root}/tmp/backup-json-data"
  end

  organize DeflateData, RecordData
end