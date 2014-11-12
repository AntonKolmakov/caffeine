class UnpackData
  include Interactor

  def call
    string = IO.read(context.local_file_path)
    context.data = JSON.parse(Zlib::Inflate.new.inflate(string))
    context.model = context.data.keys
  end
end
