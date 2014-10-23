class ExportData
  include Interactor

  before do
    context.file_name = 'my-json-data'
    context.local_file_path = local_file_path
  end

  def call
    prepare_data(context.model) &&
    deflate_data &&
    write_to_file
    upload_to_s3 unless context.model
  end

  protected

  def prepare_data(array)
    context.uncompressed_data = {}
    array.each do |model|
      klass = Object.const_get(model)
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
    s3 = AWS::S3.new
    bucket = s3.buckets[Rails.application.secrets.s3_bucket]
    object = bucket.objects[context.file_name]
    object.write(Pathname.new(context.local_file_path))
  end

  def local_file_path
    if context.model
      "#{Rails.root}/tmp/backup-json-data"
    else
      "/tmp/#{context.file_name}"
    end
  end
end
