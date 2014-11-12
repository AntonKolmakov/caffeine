module ImportProductionSiteData
  class Fetch
    include Interactor

    before do
      context.file_name = 'my-json-data'
      context.local_file_path = local_file_path
      context.uncompressed_data = {}
    end

    def call
      download_from_s3
    end

    protected

    def local_file_path
      context.local_file_path ||= "#{Rails.root}/tmp/#{context.file_name}"
    end

    def download_from_s3
      import_file = ImportFile.new.s3_file
      write_file(import_file)
    end

    def write_file(import_file)
      if import_file.bucket.exists?
        File.open(local_file_path, 'wb') do |file|
          import_file.read { |chunk| file.write(chunk) }
        end

        # Returns the object's last modified time and add it to cache
        Rails.cache.write('time', import_file.last_modified, expires_in: 1.hour)
      else
        context.fail!
      end
    end
  end
end
