module Importable
  extend ActiveSupport::Concern

  module ClassMethods
    def update_import(record)
      self.transaction do
        self.destroy_all
        self.create!(record)
      end
    end
  end
end
