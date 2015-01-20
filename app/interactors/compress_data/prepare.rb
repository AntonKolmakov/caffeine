module CompressData
  class Prepare
    include Interactor

    def call
      context.model.each do |model|
        klass = model.constantize
        context.uncompressed_data[model] = klass.all.to_json(except: %i(created_at updated_at))
      end
    end
  end
end
