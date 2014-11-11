class BackupData
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

  protected

  def prepare_data(classes_to_export)
    classes_to_export.each do |model|
      klass = model.constantize
      context.uncompressed_data[model] = klass.all.to_json(except: %i(created_at updated_at))
    end
  end

  def deflate_data
    context.deflated_data = Zlib::Deflate.deflate(context.uncompressed_data.to_json, Zlib::BEST_COMPRESSION)
  end

  def write_to_file
    File.open(context.local_file_path, 'wb') do |file|
      file.write(context.deflated_data)
    end
  end
end
