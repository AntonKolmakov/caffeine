class ImportData
  include Interactor

  before do
    context.file_name = 'my-json-data'
    context.local_file_path = local_file_path
    download_from_s3 unless context.action
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
    s3 = AWS::S3.new
    bucket = s3.buckets[Rails.application.secrets.s3_bucket]
    object = bucket.objects[context.file_name]
    File.open(context.local_file_path, 'wb') do |file|
      object.read do |chunk|
        file.write(chunk)
      end
    end
  end

  def local_file_path
    if context.action
      "#{Rails.root}/tmp/backup-json-data"
    else
      "#{Rails.root}/tmp/#{context.file_name}"
    end
  end
end
