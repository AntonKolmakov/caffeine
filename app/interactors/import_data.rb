class ImportData
  include Interactor

  before do
    context.file_name = 'my-json-data'
    context.local_file_path = "#{Rails.root}/tmp/#{context.file_name}"
  end

  def call
    inflate_file
  end

  protected

  def inflate_file
    string = IO.read(context.local_file_path)
    data = JSON.parse(Zlib::Inflate.new.inflate(string))
    data.each do |k, v|
      klass = Object.const_get(k)

      item = JSON.parse(v)
      update_data(klass, item)
    end
  end

  def update_data(klass, item)
    klass.transaction do
      klass.destroy_all
      klass.create!(item)
    end
  end
end
