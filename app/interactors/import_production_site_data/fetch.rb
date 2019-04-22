module ImportProductionSiteData
  class Fetch
    include Interactor

    before do
      context.file_name = 'my-json-data'
      context.local_file_path = local_file_path
      context.uncompressed_data = {}
      context.import_file = ImportFile.new
    end

    def call
      download_from_aws
    end

    protected

    def local_file_path
      context.local_file_path ||= "#{Rails.root}/tmp/#{context.file_name}"
    end

    def download_from_aws
      context.import_file.download_to(local_file_path)
    rescue Aws::S3::Errors::NotFound
      context.fail!
    end
  end
end
