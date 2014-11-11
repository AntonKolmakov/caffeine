class BackupData < ExportData
  include Interactor

  before do
    context.local_file_path = "#{Rails.root}/tmp/backup-json-data"
    context.uncompressed_data = {}
  end

  def call
    prepare_data(context.data.keys)
    deflate_data
    write_to_file
  end
end
