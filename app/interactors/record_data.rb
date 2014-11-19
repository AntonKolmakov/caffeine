class RecordData
  include Interactor

  def call
    inflate_file
  end

  protected

  def inflate_file
    context.data.each do |key, value|
      klass = Object.const_get(key)

      record = JSON.parse(value)
      klass.update_import(record)
    end
  end
end
