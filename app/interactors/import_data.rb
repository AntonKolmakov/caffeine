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
    import_file = ImportFile.new.s3_file
    write_file(import_file)
  end

  def write_file(import_file)
    if import_file.bucket.exists?
      File.open(context.local_file_path, 'wb') do |file|
        import_file.read do |chunk|
          file.write(chunk)
        end
      end

      # Returns the object's last modified time and add it to cache
      Rails.cache.write('time', import_file.last_modified, expires_in: 1.hour)
    else
      context.fail!
    end
  end

  def local_file_path
    "#{Rails.root}/tmp/#{context.file_name}"
  end
end
