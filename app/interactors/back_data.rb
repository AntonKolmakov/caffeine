class BackData
  include Interactor

  before do
    context.uncompressed_data = Page.all.to_json(except: %i(created_at updated_at))
  end

  def call
    deflate_data &&
    write_to_file &&
    upload_to_s3
  end

  protected

  def deflate_data
    context.deflated_data = Zlib::Deflate.deflate(context.uncompressed_data)
  end

  def set_upload_attr(data)
    s3 = AWS::S3.new(
        :access_key_id => 'YOUR_ACCESS_KEY_ID',
        :secret_access_key => 'YOUR_SECRET_ACCESS_KEY')

    bucket = s3.buckets['my-s3-bucket-key']

    object = bucket.objects[compressed_data]

    object.write(Pathname.new(local_file_path))
  end
end