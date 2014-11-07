class ImportData
  include Interactor

  before do
    context.file_name = 'my-json-data'
    context.local_file_path = local_file_path
    download_from_s3
  end

  def call
    inflate_file
  end

  protected

  def inflate_file
    string = IO.read(context.local_file_path)
    data = JSON.parse(Zlib::Inflate.new.inflate(string))
    create_backup(data.keys)
    data.each do |k, v|
      klass = Object.const_get(k)

      record = JSON.parse(v)
      update_data(klass, record)
    end
  end

  def update_data(klass, item)
    klass.transaction do
      klass.destroy_all
      klass.create!(item)
    end
  end

  def create_backup(klass)
    ExportData.call(model: klass)
  end

  def download_from_s3
    fetch_bucket
    write_file
  end

  def fetch_bucket
    s3 = AWS::S3.new
    context.bucket = s3.buckets[Rails.application.secrets.s3_bucket]
    context.object = context.bucket.objects[context.file_name]
  end

  def write_file
    if context.bucket.exists?
      File.open(context.local_file_path, 'wb') do |file|
        context.object.read do |chunk|
          file.write(chunk)
        end
      end

      # Returns the object's last modified time and add it to cache
      Rails.cache.write('time', context.object.last_modified, expires_in: 1.hour)
    else
      context.fail!
    end
  end

  def local_file_path
    "#{Rails.root}/tmp/#{context.file_name}"
  end
end
