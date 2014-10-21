class ImportData
  include Interactor

  before do
    context.file_name = "my-json-data"
    context.local_file_path = "#{Rails.root}/tmp/#{context.file_name}"
  end

  def call
    inflate_file
  end

  protected

  def inflate_file
    string = IO.read(context.local_file_path)
    Zlib::Inflate.new.inflate(string)
  end