module ExportProductionSiteData
  class UploadFile
    include Interactor

    def call
      file = ImportFile.new.s3_file
      file.write(Pathname.new(context.local_file_path))
    end
  end
end
