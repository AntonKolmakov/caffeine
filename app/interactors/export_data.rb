class ExportData
  include Interactor

  before do
    context.uncompressed_data = Page.all.to_json(except: %i(created_at updated_at))
    context.file_name = "my-json-data"
    context.local_file_path = "#{Rails.root}/tmp/#{context.file_name}"
  end

  def call
    deflate_data &&
    write_to_file
  end

  protected

  def deflate_data
    zlib = Zlib::Deflate.new(Zlib::BEST_COMPRESSION)
    context.deflated_data = zlib.deflate(context.uncompressed_data)
  end

  def write_to_file
    File.open(context.local_file_path, 'wb') do |file|
      file.write(context.deflated_data)
    end
  end

  def upload_to_s3
    s3 = AWS::S3.new(
        access_key_id: 'YOUR_ACCESS_KEY_ID',
        secret_access_key: 'YOUR_SECRET_ACCESS_KEY')

    bucket = s3.buckets['my-s3-bucket-key']

    object = bucket.objects[context.file_name]

    object.write(Pathname.new(local_file_path))
  end
end