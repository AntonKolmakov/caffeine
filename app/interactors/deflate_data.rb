class DeflateData
  include Interactor

  def call
    deflate_data
  end

  protected

  def deflate_data
    string = IO.read(context.local_file_path)
    context.data = JSON.parse(Zlib::Inflate.new.inflate(string))
  end
end
