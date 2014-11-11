class BackupData
  include Interactor

  before do
    context.local_file_path = "#{Rails.root}/tmp/backup-json-data"
  end
end
