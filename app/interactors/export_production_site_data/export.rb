module ExportProductionSiteData
  class Export
    include Interactor::Organizer

    before do
      context.file_name = 'my-json-data'
      context.local_file_path = "/tmp/#{context.file_name}"
      context.uncompressed_data = {}
    end

    organize CompressData::Pack, ExportProductionSiteData::UploadFile
  end
end
