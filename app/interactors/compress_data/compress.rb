module CompressData
  class Compress
    include Interactor

    def call
      context.compressed_data = Zlib::Deflate.deflate(context.uncompressed_data.to_json, Zlib::BEST_COMPRESSION)
    end
  end
end
