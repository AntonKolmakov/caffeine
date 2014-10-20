module Admin
  class BackupController < Admin::ApplicationController
    def export
      BackData.export
    end

    def import
      BackData.import
    end
  end
end