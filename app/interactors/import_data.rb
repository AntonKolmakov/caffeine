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
    data = JSON.parse(Zlib::Inflate.new.inflate(string))
    update_data(data)
  end

  def update_data(data)
    Page.transaction do
      Page.destroy_all
      Page.create!(data)
    end
  end
end