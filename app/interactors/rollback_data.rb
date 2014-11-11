class RollbackData
  include Interactor

  def call
    inflate_file
  end

  protected

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
