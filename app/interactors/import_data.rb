class ImportData
  include Interactor

  before do
    context.file_name = 'my-json-data'
    context.local_file_path = local_file_path
  end

  def call
    inflate_file
  end

  protected

  def local_file_path
    context.local_file_path ||= "#{Rails.root}/tmp/#{context.file_name}"
  end

  def inflate_file
    context.data.each do |k, v|
      klass = Object.const_get(k)

      record = JSON.parse(v)
      update_data(klass, record)
    end
  end

  def update_data(klass, item)
    klass.transaction do
      klass.destroy_all
      klass.create!(item)
    end
  end
end
