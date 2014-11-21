module Importable
  extend ActiveSupport::Concern

  module ClassMethods
    def update_import(record)
      transaction do
        destroy_all
        create!(record)
      end
    end
  end
end
