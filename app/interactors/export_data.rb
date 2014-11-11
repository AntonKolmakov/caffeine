class ExportData
  include Interactor

  before do
    context.file_name = 'my-json-data'
    context.local_file_path = local_file_path
    context.uncompressed_data = {}
  end

  def call
    prepare_data(context.model) &&
    deflate_data &&
    write_to_file &&
    upload_to_s3
  end

  protected

  def local_file_path
    "/tmp/#{context.file_name}"
  end

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

  def upload_to_s3
    file = ImportFile.new.import_file
    file.write(Pathname.new(context.local_file_path))
  end
end
