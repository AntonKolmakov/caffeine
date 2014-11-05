class RollbackData < ImportData
  before do
    context.file_name = 'my-json-data'
    context.local_file_path = "#{Rails.root}/tmp/backup-json-data"
  end
end
