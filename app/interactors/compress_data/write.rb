module CompressData
  class Write
    include Interactor

    def call
      File.open(context.local_file_path, 'wb') do |file|
        file.write(context.compressed_data)
      end
    end
  end
end
